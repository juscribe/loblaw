# encoding: utf-8

module Loblaw
  module HtmlHelper

    def br_clear
      tag(:br, class: 'clear')
    end

    def heading_for(record)
      send(:"heading_for_#{record.class.model_name.element}", record)
    end
  end
end
