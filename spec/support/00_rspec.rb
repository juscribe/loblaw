# encoding: utf-8
require 'rspec/core/configuration'
require 'active_support/core_ext/module/delegation'

module RSpec
  class Core::Configuration
    def resolve_lazy_configurations!
      lazy_configurations.each { |c| c.call(self) }
    end

    def resolve_lazy_each_runs!
      lazy_each_runs.each { |c| c.call(self) }
    end
  end

  class << self
    def enable_lazy_configs!
      configure do |config|
        config.add_setting :lazy_configurations,  default: []
        config.add_setting :lazy_each_runs,       default: []
      end
    end

    def lazy_configure(&block)
      configuration.lazy_configurations << block

    end

    def lazy_each_run(&block)
      configuration.lazy_each_runs << block
    end

    delegate :resolve_lazy_configurations!,
             :resolve_lazy_each_runs!, to: :configuration
  end
end

RSpec.enable_lazy_configs!
