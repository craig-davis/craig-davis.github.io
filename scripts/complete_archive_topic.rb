#!/usr/bin/env ruby

require "csv"

TOPIC_NAMES = {
  "machines" => "Machines",
  "making" => "Making",
  "software" => "Software",
  "reading-life" => "Reading & Life"
}.freeze

topic_key = ARGV.fetch(0) { abort "Usage: ruby scripts/complete_archive_topic.rb TOPIC" }
topic_name = TOPIC_NAMES.fetch(topic_key) { abort "Unknown topic: #{topic_key}" }
inventory_path = "docs/modernization/content-inventory.csv"
table = CSV.read(inventory_path, headers: true)
updated = 0

table.each do |row|
  next unless row["primary_topic"] == topic_name && row["status"] == "active"

  row["headings"] = "complete"
  row["callouts"] = "complete"
  row["related_posts"] = "complete"
  row["products"] = "complete"
  row["links"] = "reviewed"
  row["qa"] = "complete"
  row["status"] = "complete"
  updated += 1
end

CSV.open(inventory_path, "w", write_headers: true, headers: table.headers) do |csv|
  table.each { |row| csv << row }
end

puts "Marked #{updated} #{topic_name} inventory rows complete."
