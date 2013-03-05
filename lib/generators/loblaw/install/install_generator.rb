# encoding: utf-8
require 'rails/generators/active_record'

module Loblaw
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
    end
  end
end
