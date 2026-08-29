#!/usr/bin/env ruby

require "date"
require "json"
require "yaml"

TAG_DATA = YAML.safe_load(File.read("_data/tags.yml"))
TOPICS = %w[machines making software reading-life].freeze

DESCRIPTION_OVERRIDES = {
  "_posts/2011-08-23-google-event-tracking-from-php.markdown" => "Sending Google Analytics event-tracking requests from PHP to count downloads that bypass browser-side JavaScript.",
  "_posts/2011-11-03-ios-html-application-configuration.md" => "The Apple-specific meta tags and startup images used to configure a home-screen web application on early versions of iOS.",
  "_posts/2012-02-09-mysql-list-of-privileges-for-a-database.markdown" => "Auditing MySQL database privileges by querying grants and information-schema tables from the command line.",
  "_posts/2012-07-29-handlebars-helpers-for-debugging-and-pluralization.md" => "Two Handlebars helpers for inspecting template context and choosing singular or plural labels while rendering.",
  "_posts/2012-08-23-dotfiles-for-puppet-installation.markdown" => "Using a small dotfiles repository and Puppet manifests to make a freshly installed development machine familiar again.",
  "_posts/2012-10-16-pchart-updated-with-image-maps.markdown" => "Updating the pChart PHP library to generate server-side charts with clickable image-map regions.",
  "_posts/2012-12-05-html-minifier-and-handlebars-compiler-for-jst-and-backbonejs.markdown" => "A small build tool that minifies Handlebars templates and compiles them for JST and Backbone.js applications.",
  "_posts/2015-05-05-enable-mysql-logging-for-debugging.markdown" => "Enabling and tailing the MySQL general query log at runtime while debugging an application.",
  "_posts/2016-02-23-white-mesa-snow-ride.markdown" => "Photographs from a snowy motorcycle ride with Jeremy through the White Mesa trails near San Ysidro, New Mexico.",
  "_posts/2020-11-22-WEN-4214-Drill-Press-Unboxing-and-Review.markdown" => "A firsthand review of the WEN 4214 variable-speed drill press after assembling and using it in a home workshop."
}.freeze

def front_matter(source, path)
  match = source.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  raise "Missing front matter: #{path}" unless match

  [match, YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}]
end

changed = 0
Dir.glob("_posts/*").sort.each do |path|
  source = File.read(path, encoding: "UTF-8")
  match, data = front_matter(source, path)
  next if data["published"] == false

  tags = Array(data["tags"]).map(&:to_s)
  topic = data["topic"].to_s
  topic = TAG_DATA.dig(tags.first, "topic").to_s if topic.empty? && tags.first
  topic = "reading-life" if topic.empty?
  raise "Unknown topic #{topic.inspect} in #{path}" unless TOPICS.include?(topic)

  description = DESCRIPTION_OVERRIDES[path] || data["description"] || data["subtitle"]
  raise "Missing description source: #{path}" if description.to_s.strip.empty?

  metadata = match[1].dup
  if data.key?("description") && data["description"].to_s.strip.empty?
    metadata.sub!(/^description\s*:.*$/, "description: #{JSON.generate(description.to_s.strip)}")
  elsif !data.key?("description")
    anchor = metadata.match(/^subtitle\s*:.*$/) || metadata.match(/^title\s*:.*$/)
    raise "Cannot place description in #{path}" unless anchor
    metadata.insert(anchor.end(0), "\ndescription: #{JSON.generate(description.to_s.strip)}")
  end
  unless data.key?("topic")
    anchor = metadata.match(/^tags\s*:.*$/) || metadata.match(/^description\s*:.*$/)
    raise "Cannot place topic in #{path}" unless anchor
    metadata.insert(anchor.end(0), "\ntopic: #{topic}")
  end

  updated = source.sub(match[1], metadata)
  next if updated == source

  File.write(path, updated)
  changed += 1
end

puts "Archive metadata migration complete: #{changed} post(s) updated."
