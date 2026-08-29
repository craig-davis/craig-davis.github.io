#!/usr/bin/env ruby

require "csv"
require "date"
require "optparse"
require "yaml"

options = { output: nil, check: false }
related_data = YAML.safe_load(File.read("_data/related.yml")) || {}
OptionParser.new do |parser|
  parser.banner = "Usage: ruby scripts/editorial_suggestions.rb [--output FILE] [--check]"
  parser.on("--output FILE", "Write review queue as CSV") { |value| options[:output] = value }
  parser.on("--check", "Validate that every published post can be analyzed") { options[:check] = true }
end.parse!

def front_matter(path)
  source = File.read(path, encoding: "UTF-8")
  match = source.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  raise "Missing front matter: #{path}" unless match

  YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
end

posts = Dir.glob("_posts/*").sort.map do |path|
  data = front_matter(path)
  next if data["published"] == false

  tags = Array(data["tags"]).map(&:to_s)
  filename = File.basename(path).sub(/\.(?:md|markdown|html)\z/, "")
  date_prefix, slug = filename.match(/\A(\d{4}-\d{1,2}-\d{1,2})-(.+)\z/).captures
  published_date = data["date"] ? Date.parse(data["date"].to_s) : Date.parse(date_prefix)
  url = "/#{published_date.strftime('%Y/%m/%d')}/#{slug}/"
  {
    path: path,
    title: data["title"].to_s.strip,
    description: (data["description"] || data["subtitle"]).to_s.strip,
    topic: data["topic"].to_s.strip,
    tags: tags,
    related: Array(data["related"]).map(&:to_s) + Array(related_data[url]).map(&:to_s)
  }
end.compact

rows = posts.map do |post|
  candidates = posts.reject { |candidate| candidate[:path] == post[:path] }.map do |candidate|
    shared_tags = post[:tags] & candidate[:tags]
    score = shared_tags.length * 3
    score += 2 if !post[:topic].empty? && post[:topic] == candidate[:topic]
    [candidate, score, shared_tags]
  end.select { |_candidate, score, _tags| score.positive? }
     .sort_by { |candidate, score, _tags| [-score, candidate[:title]] }
     .first(3)

  issues = []
  issues << "missing description" if post[:description].empty?
  issues << "short description" if !post[:description].empty? && post[:description].length < 50
  issues << "missing explicit topic" if post[:topic].empty?
  issues << "review related writing" if post[:related].empty? && !candidates.empty?

  {
    "path" => post[:path],
    "title" => post[:title],
    "issues" => issues.join("; "),
    "suggested_related" => candidates.map { |candidate, _score, _tags| candidate[:path] }.join(" | ")
  }
end

if options[:check]
  abort "Editorial suggestions found no published posts" if posts.empty?
  untitled = rows.select { |row| row["title"].empty? }
  abort "Editorial suggestions found #{untitled.length} untitled post(s)" unless untitled.empty?
end

if options[:output]
  CSV.open(options[:output], "w") do |csv|
    csv << %w[path title issues suggested_related]
    rows.each { |row| csv << row.values_at("path", "title", "issues", "suggested_related") }
  end
  puts "Wrote #{rows.length} review rows to #{options[:output]}"
else
  issue_count = rows.count { |row| !row["issues"].empty? }
  puts "Editorial suggestion workflow passed."
  puts "  Published posts analyzed: #{rows.length}"
  puts "  Posts queued for human review: #{issue_count}"
end
