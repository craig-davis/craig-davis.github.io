#!/usr/bin/env ruby

require "json"
require "yaml"

TOPIC_NAMES = {
  "machines" => "Machines",
  "making" => "Making",
  "software" => "Software",
  "reading-life" => "Reading & Life"
}.freeze

topic_key = ARGV.fetch(0) { abort "Usage: ruby scripts/verify_archive_topic.rb TOPIC [SITE]" }
site_dir = File.expand_path(ARGV.fetch(1, "public"))
topic_name = TOPIC_NAMES.fetch(topic_key) { abort "Unknown topic: #{topic_key}" }
index = JSON.parse(File.read(File.join(site_dir, "search-index.json")))
articles = index.select { |record| record["topic"] == topic_name }
related = YAML.safe_load(File.read("_data/related.yml")) || {}
archive_notes = YAML.safe_load(File.read("_data/archive_notes.yml")) || {}
known_urls = index.map { |record| record["url"] }
failures = []
related_links = 0
rendered_notes = 0

if topic_key == "software"
  %w[regular bold italic bolditalic].each do |style|
    font_path = "fonts/hack-#{style}-subset.woff2"
    failures << "missing self-hosted Hack font: #{font_path}" unless File.file?(font_path) && File.size(font_path).positive?
  end
  syntax_css = File.read("css/syntax.css")
  failures << "syntax CSS does not declare Hack" unless syntax_css.include?("font-family: \"Hack\"")
end

articles.each do |article|
  url = article.fetch("url")
  description_length = article.fetch("description").strip.length
  failures << "#{url} description should be 50–180 characters, got #{description_length}" unless (50..180).cover?(description_length)
  destinations = Array(related[url])
  failures << "#{url} needs two or three curated related articles" unless (2..3).cover?(destinations.length)
  failures << "#{url} repeats a related destination" unless destinations.uniq.length == destinations.length
  failures << "#{url} relates to itself" if destinations.include?(url)
  unknown = destinations - known_urls
  failures << "#{url} has unknown related destinations: #{unknown.join(', ')}" unless unknown.empty?
  related_links += destinations.length

  path = File.join(site_dir, url.sub(%r{\A/}, ""), "index.html")
  unless File.file?(path)
    failures << "missing generated article: #{url}"
    next
  end
  html = File.read(path, encoding: "UTF-8", invalid: :replace, undef: :replace)
  card_count = html.scan(/class="related-card"/).length
  failures << "#{url} renders #{card_count} related cards, expected #{destinations.length}" unless card_count == destinations.length

  headings = html.scan(/<h([1-6])\b/i).flatten.map(&:to_i)
  jumps = headings.each_cons(2).select { |from, to| to > from + 1 }
  failures << "#{url} has heading-level jumps: #{jumps.inspect}" unless jumps.empty?

  if archive_notes.key?(url)
    rendered_notes += 1
    failures << "#{url} does not render its archive note" unless html.include?("id=\"callout-archive-note\"")
  end
end

if failures.empty?
  puts "#{topic_name} archive verification passed."
  puts "  Reviewed articles: #{articles.length}"
  puts "  Curated related destinations: #{related_links}"
  puts "  Contextual archive notes: #{rendered_notes}"
else
  warn "#{topic_name} archive verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
