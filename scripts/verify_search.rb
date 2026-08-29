#!/usr/bin/env ruby

require "json"
require "pathname"

site_dir = File.expand_path(ARGV.fetch(0, "public"))
index_path = File.join(site_dir, "search-index.json")
page_path = File.join(site_dir, "search", "index.html")
failures = []

unless File.file?(index_path)
  abort "Search verification failed: missing /search-index.json"
end

begin
  records = JSON.parse(File.read(index_path))
rescue JSON::ParserError => error
  abort "Search verification failed: invalid JSON: #{error.message}"
end

failures << "search index must be an array" unless records.is_a?(Array)
records = [] unless records.is_a?(Array)
failures << "search index is empty" if records.empty?

required = %w[title description url date year topic tags]
records.each_with_index do |record, index|
  missing = required.reject { |key| record.key?(key) }
  failures << "record #{index + 1} is missing: #{missing.join(', ')}" unless missing.empty?
  failures << "record #{index + 1} has an invalid local URL" unless record["url"].to_s.start_with?("/")
  failures << "record #{index + 1} title contains HTML" if record["title"].to_s.match?(/<[^>]+>/)
  failures << "record #{index + 1} tags must be an array" unless record["tags"].is_a?(Array)

  target = File.join(site_dir, record["url"].sub(%r{\A/}, ""), "index.html")
  failures << "record #{index + 1} points to missing page #{record['url']}" unless File.file?(target)
end

duplicate_urls = records.group_by { |record| record["url"] }.select { |_url, matches| matches.length > 1 }.keys
failures << "duplicate search URLs: #{duplicate_urls.join(', ')}" unless duplicate_urls.empty?

if File.file?(page_path)
  page = File.read(page_path)
  failures << "search page is missing its form" unless page.include?("data-search-form")
  failures << "search page is missing its result status" unless page.include?("aria-live=\"polite\"")
  failures << "search page is missing its no-JavaScript archive path" unless page.include?("<noscript>")
  failures << "search script is not loaded with defer" unless page.match?(%r{<script[^>]+src="/js/search\.js"[^>]+defer})
else
  failures << "missing /search/ page"
end

if failures.empty?
  puts "Search verification passed."
  puts "  Indexed articles: #{records.length}"
  puts "  Unique local destinations: #{records.map { |record| record['url'] }.uniq.length}"
else
  warn "Search verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
