#!/usr/bin/env ruby

site_dir = File.expand_path(ARGV.fetch(0, "public"))
failures = []
articles = 0
links = 0

Dir.glob(File.join(site_dir, "**", "*.html")).sort.each do |path|
  html = File.read(path, encoding: "UTF-8", invalid: :replace, undef: :replace)
  next unless html.include?("class=\"article-toc\"")

  articles += 1
  source = path.delete_prefix(site_dir)
  failures << "#{source} does not load article-toc.js with defer" unless html.match?(%r{<script[^>]+src="/js/article-toc\.js"[^>]+defer})
  failures << "#{source} lacks accessible current-section text" unless html.include?("data-toc-current")

  toc = html[/<nav class="article-toc".*?<\/nav>/m].to_s
  toc.scan(/href="#([^"]+)"/).flatten.each do |id|
    links += 1
    failures << "#{source} TOC points to missing ##{id}" unless html.match?(/\bid=["']#{Regexp.escape(id)}["']/)
  end
end

failures << "no generated articles exercise reading-state navigation" if articles.zero?

if failures.empty?
  puts "Reading-state verification passed."
  puts "  Articles with curated navigation: #{articles}"
  puts "  Valid section destinations: #{links}"
else
  warn "Reading-state verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
