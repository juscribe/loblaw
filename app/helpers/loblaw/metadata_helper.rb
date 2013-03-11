# encoding: utf-8

module Loblaw
  module MetadataHelper

    def page_title
      [app_name, @page_title.presence || action_name.humanize].join(': ')
    end

    def page_description
      @content_for_page_description
    end

    def page_creator
      @content_for_page_creator || app_name
    end

    def page_subject
      @content_for_page_subject || 'Discourses'
    end

    def page_copyright
      'Copyright %{name} 2011-%{year}. All Rights Reserved.' %
                                       { name: app_name, year: Date.today.year }
    end

    def mobile_favicon_link_tags
      raw([nil, 57, 114].map do |size|
        filename_array = ['apple-touch-icon', (size ? "#{size}x#{size}" : nil), 'precomposed' ]
        [filename_array[0, 2], filename_array].map do |ary|
          img_file, opts = ary.compact.join('-') << '.png', { rel: ary.values_at(0, 2).compact.join('-') }.significant_merge(sizes: ary[1])
          favicon_link_tag img_file, opts.merge(type: 'image/png')
        end
      end.flatten.join("\r\n"))
    end

    def brand_tags
      content_tag :h1, id: 'logo', class: 'brand' do
        link_to(app_name, loblaw.root_path, rel: 'home')
      end
    end

    def link_to_external(*args, &block)
      if block_given?
        link_to(capture(&block), args[0], _add_external_attrs(args[1]))
      else
        link_to(*args[0, 2], _add_external_attrs(args[2]))
      end
    end

    def _add_external_attrs(html_opts)
      html_opts ||= {}
      html_opts[:rel] = [*html_opts[:rel], 'external', 'nofollow'].join(' ')
      # html_options[:class] = [*html_options[:class], 'external'].join(' ') # For lesser IE's
      html_opts
    end
  end
end
