#!/usr/bin/env ruby

require "rexml/document"
require "set"
require "uri"

site_dir = File.expand_path(ARGV.fetch(0, "public"))
failures = []

def read_xml(path, failures)
  REXML::Document.new(File.read(path))
rescue Errno::ENOENT, REXML::ParseException => error
  failures << "cannot parse #{path}: #{error.message}"
  nil
end

feed = read_xml(File.join(site_dir, "feed.xml"), failures)
sitemap = read_xml(File.join(site_dir, "sitemap.xml"), failures)

if feed
  items = REXML::XPath.match(feed, "/rss/channel/item")
  failures << "feed must contain 10 recent articles, found #{items.length}" unless items.length == 10
  items.each_with_index do |item, index|
    %w[title description link guid pubDate].each do |field|
      value = item.elements[field]&.text.to_s.strip
      failures << "feed item #{index + 1} has an empty #{field}" if value.empty?
    end
  end
end

if sitemap
  locations = REXML::XPath.match(sitemap, "//*[local-name()='loc']").map { |node| node.text.to_s.strip }
  failures << "sitemap contains duplicate locations" unless locations.length == locations.to_set.length

  required = %w[/ /about/ /posts/ /projects/ /gear/ /search/]
  required.concat(%w[machines making software reading-life].map { |topic| "/topics/#{topic}/" })
  required.concat(%w[bike css javascript jeep motorcycles mysql photos php podcast python reading recipes tools ux woodworking].map { |tag| "/tags/#{tag}/" })
  required.each do |route|
    failures << "sitemap is missing #{route}" unless locations.include?("https://there4.io#{route}")
  end

  %w[/404.html /pete/ /xj-ext-idle/ /xj-switches/ /flat-trim/ /running-calculator/].each do |route|
    failures << "sitemap must exclude #{route}" if locations.include?("https://there4.io#{route}")
  end

  locations.each do |location|
    uri = URI.parse(location)
    failures << "sitemap contains a non-production URL: #{location}" unless uri.scheme == "https" && uri.host == "there4.io"
  rescue URI::InvalidURIError
    failures << "sitemap contains an invalid URL: #{location}"
  end
end

robots_path = File.join(site_dir, "robots.txt")
robots = File.file?(robots_path) ? File.read(robots_path) : ""
failures << "robots.txt does not advertise the sitemap" unless robots.include?("Sitemap: https://there4.io/sitemap.xml")

if failures.empty?
  puts "Launch artifact verification passed."
  puts "  Feed items: 10"
  puts "  Sitemap locations: #{REXML::XPath.match(sitemap, "//*[local-name()='loc']").length}"
  puts "  Redirects, 404 page, and protected calculators excluded from sitemap"
else
  warn "Launch artifact verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
