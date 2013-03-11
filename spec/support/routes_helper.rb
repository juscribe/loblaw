# encoding: utf-8
require 'rspec/rails/example/routing_example_group'
require 'active_support/concern'

module RSpec::Rails
  module RoutingExampleGroup
    extend ActiveSupport::Concern
    # Repetitive, but replacing existing included call.
    included do
      metadata[:type] = :routing

      before do
        @routes = ::Loblaw::Engine.routes
        assertion_instance.instance_variable_set(:@routes, @routes)
      end
    end
  end
end
