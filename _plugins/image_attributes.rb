# frozen_string_literal: true

require "cgi"

module There4
  module ImageAttributes
    module_function

    SOF_MARKERS = [0xC0, 0xC1, 0xC2, 0xC3, 0xC5, 0xC6, 0xC7, 0xC9, 0xCA, 0xCB, 0xCD, 0xCE, 0xCF].freeze

    def dimensions(path)
      @dimensions ||= {}
      @dimensions[path] ||= read_dimensions(path)
    end

    def read_dimensions(path)
      data = File.binread(path)
      return data.byteslice(16, 8).unpack("NN") if data.start_with?("\x89PNG\r\n\x1A\n".b)
      return data.byteslice(6, 4).unpack("vv") if data.start_with?("GIF87a", "GIF89a")
      return jpeg_dimensions(data) if data.start_with?("\xFF\xD8".b)

      nil
    rescue Errno::ENOENT, Errno::EACCES
      nil
    end

    def jpeg_dimensions(data)
      offset = 2
      while offset < data.bytesize
        offset += 1 while offset < data.bytesize && data.getbyte(offset) != 0xFF
        offset += 1 while offset < data.bytesize && data.getbyte(offset) == 0xFF
        marker = data.getbyte(offset)
        offset += 1
        next if marker.nil? || marker == 0xD8 || marker == 0xD9

        length = data.byteslice(offset, 2)&.unpack1("n")
        return nil unless length && length >= 2
        if SOF_MARKERS.include?(marker)
          height, width = data.byteslice(offset + 3, 4).unpack("nn")
          return [width, height]
        end
        offset += length
      end
      nil
    end

    def attribute(tag, name)
      tag[/\b#{Regexp.escape(name)}\s*=\s*["']([^"']*)["']/i, 1]
    end

    def add_attribute(tag, name, value)
      return tag if tag.match?(/\b#{Regexp.escape(name)}\s*=/i)

      tag.sub(/\s*\/?>(?=\z)/, %( #{name}="#{CGI.escapeHTML(value.to_s)}"\\0))
    end

    def remove_attribute(tag, name)
      tag.sub(/\s+#{Regexp.escape(name)}\s*=\s*["'][^"']*["']/i, "")
    end

    def local_path(site, src)
      return nil if src.nil? || src.empty? || src.start_with?("//") || src.match?(/\A[a-z][a-z0-9+.-]*:/i)

      clean = CGI.unescape(src.split(/[?#]/, 2).first)
      relative = clean.sub(%r{\A/+}, "")
      path = File.expand_path(relative, site.source)
      source = File.expand_path(site.source)
      path.start_with?("#{source}/") ? path : nil
    end

    def responsive_attributes(site, src, path)
      extension = File.extname(path)
      stem = path.delete_suffix(extension)
      variants = [640, 1280].filter_map do |width|
        variant_path = "#{stem}.#{width}.webp"
        next unless File.file?(variant_path)

        public_path = src.split(/[?#]/, 2).first.sub(/#{Regexp.escape(extension)}\z/i, ".#{width}.webp")
        "#{public_path} #{width}w"
      end
      variants.empty? ? nil : variants.join(", ")
    end

    def process_tag(tag, site)
      src = attribute(tag, "src")
      path = local_path(site, src)
      natural_width, natural_height = path && dimensions(path)
      width = attribute(tag, "width")&.to_i
      height = attribute(tag, "height")&.to_i

      if natural_width && natural_height
        if width&.positive? && !height&.positive?
          height = (natural_height * width.to_f / natural_width).round
        elsif height&.positive? && !width&.positive?
          width = (natural_width * height.to_f / natural_height).round
        else
          width ||= natural_width
          height ||= natural_height
        end
        tag = add_attribute(tag, "width", width)
        tag = add_attribute(tag, "height", height)
      end

      unless tag.match?(/\balt\s*=/i)
        tag = add_attribute(tag, "alt", "")
        tag = add_attribute(tag, "role", "presentation")
      end
      tag = add_attribute(tag, "decoding", "async")

      if tag.match?(/\bdata-eager(?:\s*=\s*["'][^"']*["'])?/i)
        tag = tag.sub(/\s+data-eager(?:\s*=\s*["'][^"']*["'])?/i, "")
        tag = add_attribute(tag, "loading", "eager")
        tag = add_attribute(tag, "fetchpriority", "high")
      else
        tag = add_attribute(tag, "loading", "lazy")
      end

      responsive_type = attribute(tag, "data-responsive")
      if path
        srcset = responsive_attributes(site, src, path)
        tag = add_attribute(tag, "srcset", srcset) if srcset
        if srcset
          sizes = responsive_type == "header" ? "(max-width: 54rem) calc(100vw - 2rem), 60vw" : "(max-width: 48rem) calc(100vw - 2rem), 46rem"
          tag = add_attribute(tag, "sizes", sizes)
        end
      end
      tag = remove_attribute(tag, "data-responsive") if responsive_type
      tag
    end

    def process(document)
      return unless document.output_ext == ".html"

      document.output = document.output.gsub(/<img\b[^>]*>/i) { |tag| process_tag(tag, document.site) }
    end
  end
end

Jekyll::Hooks.register :pages, :post_render, &There4::ImageAttributes.method(:process)
Jekyll::Hooks.register :documents, :post_render, &There4::ImageAttributes.method(:process)
