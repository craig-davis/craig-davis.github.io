#!/usr/bin/env ruby

require "fileutils"
require "json"
require "optparse"
require "pathname"
require "set"
require "uri"

class SiteAudit
  IGNORABLE_SCHEMES = %w[data http https javascript mailto tel].freeze

  attr_reader :site_dir

  def initialize(site_dir)
    @site_dir = File.expand_path(site_dir)
    raise "Site directory does not exist: #{site_dir}" unless Dir.exist?(@site_dir)
  end

  def public_urls
    files.map { |path| "/#{relative(path)}" }.sort
  end

  def quality_report
    report = {
      "html_files" => html_files.length,
      "missing_main" => [],
      "missing_article" => [],
      "missing_description" => [],
      "missing_canonical" => [],
      "missing_open_graph_title" => [],
      "missing_json_ld" => [],
      "empty_title" => [],
      "long_title" => [],
      "empty_description" => [],
      "long_description" => [],
      "invalid_canonical" => [],
      "invalid_json_ld" => [],
      "h1_count_not_one" => [],
      "images_missing_alt" => [],
      "images_missing_dimensions" => [],
      "images_missing_loading" => [],
      "images_missing_decoding" => [],
      "broken_internal_references" => [],
      "oversized_assets" => []
    }

    html_files.each do |path|
      source = public_path(path)
      html = File.read(path, encoding: "UTF-8", invalid: :replace, undef: :replace)

      report["missing_main"] << source unless html.match?(/<main\b/i)
      report["missing_article"] << source unless html.match?(/<article\b/i)
      report["missing_description"] << source unless html.match?(/<meta\b[^>]*\bname\s*=\s*["']description["']/i)
      report["missing_canonical"] << source unless html.match?(/<link\b[^>]*\brel\s*=\s*["']canonical["']/i)
      report["missing_open_graph_title"] << source unless html.match?(/<meta\b[^>]*\bproperty\s*=\s*["']og:title["']/i)
      report["missing_json_ld"] << source unless html.match?(/<script\b[^>]*\btype\s*=\s*["']application\/ld\+json["']/i)

      title = html[/<title\b[^>]*>(.*?)<\/title>/im, 1].to_s.gsub(/<[^>]+>/, "").strip
      description_tag = html[/<meta\b[^>]*\bname\s*=\s*["']description["'][^>]*>/i]
      description = description_tag && attribute(description_tag, "content").to_s.strip
      canonical_tag = html[/<link\b[^>]*\brel\s*=\s*["']canonical["'][^>]*>/i]
      canonical = canonical_tag && attribute(canonical_tag, "href").to_s.strip
      report["empty_title"] << source if title.empty?
      report["long_title"] << { "source" => source, "length" => title.length } if title.length > 70
      report["empty_description"] << source if description_tag && description.empty?
      report["long_description"] << { "source" => source, "length" => description.length } if description && description.length > 180
      if canonical_tag && !canonical.match?(%r{\Ahttps://there4\.io/})
        report["invalid_canonical"] << { "source" => source, "canonical" => canonical }
      end

      html.scan(/<script\b[^>]*\btype\s*=\s*["']application\/ld\+json["'][^>]*>(.*?)<\/script>/im).each_with_index do |match, index|
        JSON.parse(match.first)
      rescue JSON::ParserError => error
        report["invalid_json_ld"] << { "source" => source, "index" => index + 1, "error" => error.message }
      end

      h1_count = html.scan(/<h1\b/i).length
      report["h1_count_not_one"] << { "source" => source, "count" => h1_count } unless h1_count == 1

      html.scan(/<img\b[^>]*>/i).each_with_index do |tag, index|
        image = { "source" => source, "index" => index + 1, "src" => attribute(tag, "src") }
        report["images_missing_alt"] << image unless tag.match?(/\balt\s*=/i)
        unless tag.match?(/\bwidth\s*=/i) && tag.match?(/\bheight\s*=/i)
          report["images_missing_dimensions"] << image
        end
        report["images_missing_loading"] << image unless tag.match?(/\bloading\s*=/i)
        report["images_missing_decoding"] << image unless tag.match?(/\bdecoding\s*=/i)
      end

      referenced_urls(html).each do |reference|
        next if reference_resolves?(path, reference["target"])

        report["broken_internal_references"] << {
          "source" => source,
          "element" => reference["element"],
          "attribute" => reference["attribute"],
          "target" => reference["target"]
        }
      end
    end

    files.each do |path|
      next if html_files.include?(path)
      next unless File.size(path) > 1_500_000

      report["oversized_assets"] << { "source" => public_path(path), "bytes" => File.size(path) }
    end

    report.each_value do |value|
      value.sort_by! { |entry| entry.is_a?(Hash) ? entry.values.map(&:to_s) : entry.to_s } if value.is_a?(Array)
    end
    report
  end

  private

  def files
    @files ||= Dir.glob(File.join(site_dir, "**", "*"), File::FNM_DOTMATCH)
                  .select { |path| File.file?(path) }
  end

  def html_files
    @html_files ||= files.select { |path| File.extname(path).downcase == ".html" }
  end

  def relative(path)
    Pathname.new(path).relative_path_from(Pathname.new(site_dir)).to_s
  end

  def public_path(path)
    "/#{relative(path)}"
  end

  def attribute(tag, name)
    match = tag.match(/\b#{Regexp.escape(name)}\s*=\s*["']([^"']*)["']/i)
    match && match[1]
  end

  def referenced_urls(html)
    references = []
    {
      "a" => ["href"],
      "img" => ["src"],
      "script" => ["src"],
      "link" => ["href"],
      "iframe" => ["src"]
    }.each do |element, attributes|
      html.scan(/<#{element}\b[^>]*>/i).each do |tag|
        attributes.each do |attribute_name|
          target = attribute(tag, attribute_name)
          next if target.nil? || target.empty? || ignorable_reference?(target)

          references << {
            "element" => element,
            "attribute" => attribute_name,
            "target" => target
          }
        end
      end
    end
    references
  end

  def ignorable_reference?(target)
    return true if target.start_with?("#", "//")

    uri = URI.parse(target)
    uri.scheme && IGNORABLE_SCHEMES.include?(uri.scheme.downcase)
  rescue URI::InvalidURIError
    false
  end

  def reference_resolves?(source_file, target)
    clean_target = URI::DEFAULT_PARSER.unescape(target.split(/[?#]/, 2).first)
    candidate = if clean_target.start_with?("/")
                  File.join(site_dir, clean_target.sub(%r{\A/+}, ""))
                else
                  File.expand_path(clean_target, File.dirname(source_file))
                end

    return false unless within_site?(candidate)
    return true if File.file?(candidate)
    return File.file?(File.join(candidate, "index.html")) if File.directory?(candidate) || clean_target.end_with?("/")

    File.file?(File.join(candidate, "index.html"))
  rescue ArgumentError
    false
  end

  def within_site?(candidate)
    expanded = File.expand_path(candidate)
    expanded == site_dir || expanded.start_with?("#{site_dir}/")
  end
end

def write_json(path, value)
  FileUtils.mkdir_p(File.dirname(path))
  File.write(path, "#{JSON.pretty_generate(value)}\n")
end

options = {
  site: "public",
  baseline_dir: "test/baseline",
  quality_only: false
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby scripts/verify_site.rb snapshot|verify [options]"
  opts.on("--site DIR", "Generated site directory (default: public)") { |value| options[:site] = value }
  opts.on("--baseline-dir DIR", "Baseline directory (default: test/baseline)") { |value| options[:baseline_dir] = value }
  opts.on("--quality-only", "Refresh quality debt without changing protected URLs") { options[:quality_only] = true }
end

command = ARGV.shift
parser.parse!(ARGV)
abort(parser.to_s) unless %w[snapshot verify].include?(command)

audit = SiteAudit.new(options[:site])
baseline_dir = File.expand_path(options[:baseline_dir])
url_path = File.join(baseline_dir, "public-urls.txt")
quality_path = File.join(baseline_dir, "quality-report.json")

case command
when "snapshot"
  FileUtils.mkdir_p(baseline_dir)
  File.write(url_path, "#{audit.public_urls.join("\n")}\n") unless options[:quality_only]
  write_json(quality_path, audit.quality_report)
  puts "Captured #{audit.public_urls.length} public file URLs in #{url_path}" unless options[:quality_only]
  puts "Captured generated HTML quality debt in #{quality_path}"
when "verify"
  abort("Missing URL baseline: #{url_path}") unless File.file?(url_path)
  abort("Missing quality baseline: #{quality_path}") unless File.file?(quality_path)

  failures = []
  expected_urls = File.readlines(url_path, chomp: true).reject(&:empty?).to_set
  current_urls = audit.public_urls.to_set
  missing_urls = (expected_urls - current_urls).to_a.sort
  failures << "Missing #{missing_urls.length} baseline public URLs:\n  #{missing_urls.join("\n  ")}" unless missing_urls.empty?

  %w[bin docs scripts test].each do |private_path|
    published_path = File.join(File.expand_path(options[:site]), private_path)
    failures << "Project-only content was published at #{published_path}" if File.exist?(published_path)
  end

  expected_quality = JSON.parse(File.read(quality_path))
  current_quality = audit.quality_report
  expected_quality.each do |check, expected_entries|
    next unless expected_entries.is_a?(Array)

    current_entries = current_quality.fetch(check)
    new_entries = current_entries - expected_entries
    next if new_entries.empty?

    failures << "#{check} has #{new_entries.length} new issue(s):\n  #{new_entries.map(&:inspect).join("\n  ")}"
  end

  %w[images_missing_alt images_missing_dimensions images_missing_loading images_missing_decoding].each do |check|
    entries = current_quality.fetch(check)
    next if entries.empty?

    failures << "#{check} must remain empty after the Phase 5 image migration:\n  #{entries.map(&:inspect).join("\n  ")}"
  end

  if failures.empty?
    puts "Site verification passed."
    puts "  Baseline public URLs preserved: #{expected_urls.length}"
    puts "  Current public file URLs: #{current_urls.length}"
    puts "  No new generated HTML quality regressions"
    puts "  Project documents and tooling excluded from generated output"
  else
    warn failures.join("\n\n")
    exit 1
  end
end
