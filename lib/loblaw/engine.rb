# encoding: utf-8
module Loblaw # :nodoc:

  class Engine < ::Rails::Engine # :nodoc:
    isolate_namespace Loblaw
    config.loblaw = Loblaw

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
