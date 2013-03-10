# encoding: utf-8
require 'sprockets'
require 'kaminari'
require 'modernizr-rails'
require 'bootstrap-sass'

module Loblaw # :nodoc:

  class Engine < ::Rails::Engine # :nodoc:
    isolate_namespace Loblaw

    config.loblaw = Loblaw

    initializer 'loblaw.load_app_instance_data' do |app|
      Loblaw.setup do |config|
        config.app_root = app.root
        config.engine_name = 'Loblaw'
      end
    end

    initializer 'team_page.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      # g.assets false
      # g.helper false
    end

    initializer 'loblaw.active_record' do
      ActiveSupport.on_load :active_support do
        require 'loblaw/orm/active_record'
      end
    end
  end
end
