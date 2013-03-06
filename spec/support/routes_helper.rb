# encoding: utf-8

module RSpec::Rails
  module RoutingExampleGroup
    extend ActiveSupport::Concern

    included do
      metadata[:type] = :routing

      before do
        @routes = ::Loblaw::Engine.routes
        assertion_instance.instance_variable_set(:@routes, @routes)
      end
    end
  end
end
