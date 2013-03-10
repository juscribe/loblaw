# encoding: utf-8

module Loblaw
  module ApplicationHelper

    def main_object
      instance_variable_get("@#{controller.class._implied_layout_name.singularize}") rescue nil
    end
  end
end
