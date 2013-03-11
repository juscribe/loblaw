# encoding: utf-8

module Loblaw
  module HtmlHelper

    def br_clear
      tag(:br, class: 'clear', clear: 'all')
    end

    # def heading_for(record)
    #   send(:"heading_for_#{record.class.model_name.element}", record)
    # end

    def content_tag_unless(condition, tag_name, content, opts={}, html_opts={}, &block)
      return content_tag(tag_name, content, opts, html_opts, &block) unless  condition
      return content unless block_given?
      block.arity <= 1 ? capture(&block) : capture(content, options, html_options, &block)
    end

    # def content_tag_if(condition, tag_name, content, opts={}, html_opts={}, &block)
    #   content_tag_unless(!condition, tag_name, content, opts, html_opts, &block)
    # end

    # def content_tag_for_unless(condition, tag_name, record, prefix=nil, opts=nil, &block)
    #   return content_tag_for(tag_name, record, prefix, opts, &block) unless condition
    #   block_given? ? capture(&block) : nil
    # end

    # def content_tag_for_if(condition, tag_name, record, prefix=nil, opts=nil, &block)
    #   content_tag_for_unless(!condition, tag_name, record, prefix, opts, &block)
    # end

    # def heading_for(record)
    #   send(:"heading_for_#{record.class.model_name.element}", record)
    # end
  end
end
