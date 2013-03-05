# encoding: utf-8
module Loblaw # :nodoc:

  class Engine < ::Rails::Engine # :nodoc:
    isolate_namespace Loblaw
    config.loblaw = Loblaw

    initializer 'loblaw.active_record' do
      ActiveSupport.on_load :active_support do
        require 'loblaw/orm/active_record'
      end
    end
  end
end
