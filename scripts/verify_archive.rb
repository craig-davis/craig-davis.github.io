#!/usr/bin/env ruby

require "csv"
require "date"
require "yaml"

TOPICS = %w[machines making software reading-life].freeze
CALCULATORS = %w[flat-trim/index.html running-calculator/index.html].freeze
CALCULATOR_SHA256 = {
  "flat-trim/index.html" => "f9959988cd057900598cbd7dd502bd67bd6e48dbf0e4d40bcbfee11528c23a50",
  "running-calculator/index.html" => "edc1ba7e03658536e8cb5a06c3d22b68e0c4c7cc058bfc0ec5fe6b21e3379178"
}.freeze
failures = []
published = []

Dir.glob("_posts/*").sort.each do |path|
  source = File.read(path, encoding: "UTF-8")
  match = source.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  unless match
    failures << "missing front matter: #{path}"
    next
  end
  data = YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
  next if data["published"] == false

  published << path
  failures << "#{path} needs an explicit valid topic" unless TOPICS.include?(data["topic"].to_s)
  description = data["description"].to_s.strip
  failures << "#{path} needs an explicit description" if description.empty?
  failures << "#{path} description exceeds 180 characters" if description.length > 180
  failures << "#{path} must self-host code instead of embedding a Gist" if source.include?("{% gist")
end

inventory = CSV.read("docs/modernization/content-inventory.csv", headers: true)
inventory_paths = inventory.map { |row| row["path"] }
missing_inventory = published - inventory_paths
failures << "published posts missing from inventory: #{missing_inventory.join(', ')}" unless missing_inventory.empty?

inventory.select { |row| row["status"] == "complete" }.each do |row|
  %w[new_layout description headings images_alt callouts related_posts products qa].each do |field|
    failures << "completed inventory row has unfinished #{field}: #{row['path']}" unless row[field] == "complete"
  end
  failures << "completed inventory row has unreviewed links: #{row['path']}" unless row["links"] == "reviewed"
end

CALCULATORS.each do |path|
  row = inventory.find { |candidate| candidate["path"] == path }
  failures << "calculator missing from inventory: #{path}" unless row
  failures << "calculator must be marked preserved: #{path}" unless row && row["status"] == "preserved"
  failures << "calculator file missing: #{path}" unless File.file?(path)
  if File.file?(path)
    require "digest"
    checksum = Digest::SHA256.file(path).hexdigest
    failures << "calculator changed unexpectedly: #{path}" unless checksum == CALCULATOR_SHA256.fetch(path)
  end
end

if failures.empty?
  puts "Archive verification passed."
  puts "  Published posts with explicit topics and descriptions: #{published.length}"
  puts "  Calculators preserved without migration: #{CALCULATORS.length}"
else
  warn "Archive verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
