# frozen_string_literal: true

require "cgi"
require "uri"

module There4
  module AffiliateLinks
    module_function

    AFFILIATE_SHORTLINK_HOSTS = %w[amzn.to].freeze
    AFFILIATE_QUERY_HOSTS = %w[amazon.com].freeze

    def affiliate_url?(href)
      uri = URI.parse(CGI.unescapeHTML(href.to_s))
      host = uri.host.to_s.downcase.sub(/\Awww\./, "")
      return true if AFFILIATE_SHORTLINK_HOSTS.include?(host)
      return false unless AFFILIATE_QUERY_HOSTS.any? { |candidate| host == candidate || host.end_with?(".#{candidate}") }

      URI.decode_www_form(uri.query.to_s).any? { |name, _value| name.casecmp?("tag") }
    rescue URI::InvalidURIError, ArgumentError
      false
    end

    def add_sponsored_rel(tag)
      if tag.match?(/\brel\s*=/i)
        tag.sub(/(\brel\s*=\s*)(["'])(.*?)\2/i) do
          values = Regexp.last_match(3).split
          values << "sponsored" unless values.include?("sponsored")
          %(#{Regexp.last_match(1)}#{Regexp.last_match(2)}#{values.join(' ')}#{Regexp.last_match(2)})
        end
      else
        tag.sub(/\s*\/?>(?=\z)/, %( rel="sponsored"\\0))
      end
    end

    def process(document)
      return unless document.output_ext == ".html"

      document.output = document.output.gsub(/<a\b[^>]*>/i) do |tag|
        href = tag[/\bhref\s*=\s*["']([^"']*)["']/i, 1]
        affiliate_url?(href) ? add_sponsored_rel(tag) : tag
      end
    end
  end
end

Jekyll::Hooks.register :pages, :post_render, &There4::AffiliateLinks.method(:process)
Jekyll::Hooks.register :documents, :post_render, &There4::AffiliateLinks.method(:process)
