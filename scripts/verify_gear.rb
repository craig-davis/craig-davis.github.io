#!/usr/bin/env ruby

require "yaml"
require "uri"

root = File.expand_path("..", __dir__)
site = File.join(root, "public")
data = YAML.safe_load(File.read(File.join(root, "_data", "gear.yml")), aliases: true)
categories = data.fetch("categories")
items = data.fetch("items")
failures = []

required_fields = %w[id name category summary experience documented_since recommendation article image image_alt destinations]
ids = items.map { |item| item["id"] }
duplicates = ids.tally.select { |_id, count| count > 1 }.keys
failures << "Duplicate gear IDs: #{duplicates.join(', ')}" unless duplicates.empty?

items.each do |item|
  label = item["id"] || item["name"] || "unnamed item"
  missing = required_fields.reject { |field| item.key?(field) && !item[field].nil? && item[field] != "" }
  failures << "#{label} is missing: #{missing.join(', ')}" unless missing.empty?
  failures << "#{label} uses unknown category #{item['category'].inspect}" unless categories.key?(item["category"])
  failures << "#{label} must not contain a price" if item.key?("price")

  image_path = File.join(root, item.fetch("image", "").sub(%r{\A/+}, ""))
  failures << "#{label} image does not exist: #{item['image']}" unless File.file?(image_path)

  article_path = File.join(site, item.fetch("article", "").sub(%r{\A/+}, ""), "index.html")
  failures << "#{label} article does not resolve: #{item['article']}" unless File.file?(article_path)

  Array(item["destinations"]).each_with_index do |destination, index|
    destination_label = "#{label} destination #{index + 1}"
    failures << "#{destination_label} requires a label" if destination["label"].to_s.empty?
    failures << "#{destination_label} requires an explicit affiliate boolean" unless [true, false].include?(destination["affiliate"])
    begin
      uri = URI.parse(destination.fetch("url"))
      failures << "#{destination_label} must use HTTP(S)" unless %w[http https].include?(uri.scheme)
    rescue KeyError, URI::InvalidURIError
      failures << "#{destination_label} has an invalid URL"
    end
  end
end

gear_page = File.join(site, "gear", "index.html")
if File.file?(gear_page)
  gear_html = File.read(gear_page)
  rendered_cards = gear_html.scan(/class="gear-card"/).length
  failures << "Gear page rendered #{rendered_cards} cards for #{items.length} data items" unless rendered_cards == items.length
  affiliate_destinations = items.sum { |item| Array(item["destinations"]).count { |destination| destination["affiliate"] } }
  sponsored_destinations = gear_html.scan(/<a\b[^>]*\brel="[^"]*\bsponsored\b[^"]*"[^>]*>[^<]*(?:<span>\(affiliate\)<\/span>)?/i).length
  failures << "Gear page rendered #{sponsored_destinations} sponsored destinations for #{affiliate_destinations} affiliate destinations" unless sponsored_destinations == affiliate_destinations
else
  failures << "Gear page was not generated"
end

rendered_mentions = Dir[File.join(site, "**", "*.html")].sum do |path|
  File.read(path).scan(/class="article-gear-card"/).length
end
failures << "Articles rendered #{rendered_mentions} curated gear references for #{items.length} data items" unless rendered_mentions == items.length

if failures.empty?
  puts "Gear verification passed: #{items.length} items across #{categories.length} categories, all linked from field notes."
else
  warn failures.join("\n")
  exit 1
end
