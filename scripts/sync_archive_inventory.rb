#!/usr/bin/env ruby

require "csv"
require "date"
require "yaml"

TOPIC_NAMES = {
  "machines" => "Machines",
  "making" => "Making",
  "software" => "Software",
  "reading-life" => "Reading & Life"
}.freeze

inventory_path = "docs/modernization/content-inventory.csv"
table = CSV.read(inventory_path, headers: true)
posts = {}

Dir.glob("_posts/*").each do |path|
  source = File.read(path, encoding: "UTF-8")
  match = source.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  raise "Missing front matter: #{path}" unless match
  posts[path] = YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
end

table.each do |row|
  data = posts[row["path"]]
  next unless data

  if data["published"] == false
    row["primary_topic"] = "Software"
    row["new_layout"] = "n/a"
    row["description"] = "n/a"
    row["headings"] = "n/a"
    row["images_alt"] = "n/a"
    row["callouts"] = "n/a"
    row["related_posts"] = "n/a"
    row["products"] = "n/a"
    row["links"] = "n/a"
    row["qa"] = "excluded_unpublished"
    row["status"] = "excluded"
    next
  end

  row["primary_topic"] = TOPIC_NAMES.fetch(data.fetch("topic"))
  row["new_layout"] = "complete"
  row["description"] = "complete"
  row["images_alt"] = "complete"
  row["status"] = "active" if row["status"] == "not_started"
end

CSV.open(inventory_path, "w", write_headers: true, headers: table.headers) do |csv|
  table.each { |row| csv << row }
end

puts "Synchronized #{posts.length} post records with the archive inventory."
