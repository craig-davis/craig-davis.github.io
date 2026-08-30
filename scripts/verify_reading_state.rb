#!/usr/bin/env ruby

site_dir = File.expand_path(ARGV.fetch(0, "public"))
failures = []
toc_articles = 0
reading_estimates = 0
return_links = 0
links = 0

Dir.glob(File.join(site_dir, "**", "*.html")).sort.each do |path|
  html = File.read(path, encoding: "UTF-8", invalid: :replace, undef: :replace)
  if html.match?(/<meta\b[^>]*\bproperty=["']og:type["'][^>]*\bcontent=["']article["']/i)
    reading_estimates += 1
    source = path.delete_prefix(site_dir)
    failures << "#{source} lacks a reading-time estimate" unless html.match?(/class="post-meta__reading-time">[1-9]\d* min read</)
    if html.match?(/class="return-to-top"[^>]*>\s*<a href="#top">Return to top/m) && html.match?(/<body\b[^>]*\bid="top"/)
      return_links += 1
    else
      failures << "#{source} lacks a working Return to top link"
    end
  end

  next unless html.include?("class=\"article-toc\"")

  toc_articles += 1
  source = path.delete_prefix(site_dir)
  failures << "#{source} does not load article-toc.js with defer" unless html.match?(%r{<script[^>]+src="/js/article-toc\.js"[^>]+defer})
  failures << "#{source} lacks accessible current-section text" unless html.include?("data-toc-current")

  toc = html[/<nav class="article-toc".*?<\/nav>/m].to_s
  toc.scan(/href="#([^"]+)"/).flatten.each do |id|
    links += 1
    failures << "#{source} TOC points to missing ##{id}" unless html.match?(/\bid=["']#{Regexp.escape(id)}["']/)
  end
end

failures << "no generated articles include reading-time estimates" if reading_estimates.zero?
failures << "no generated articles exercise reading-state navigation" if toc_articles.zero?

if failures.empty?
  puts "Reading-state verification passed."
  puts "  Articles with reading-time estimates: #{reading_estimates}"
  puts "  Articles with Return to top links: #{return_links}"
  puts "  Articles with curated navigation: #{toc_articles}"
  puts "  Valid section destinations: #{links}"
else
  warn "Reading-state verification failed:\n  #{failures.join("\n  ")}"
  exit 1
end
