# encoding: utf-8

def setup_environment
  ENV["RAILS_ENV"] ||= 'test'

  # Require test targets
  require File.expand_path("../dummy/config/environment", __FILE__)
  require 'loblaw'

  # Require test libraries
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'faker'
  require 'factory_girl_rails'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'capybara/poltergeist'
  require 'turnip/rspec'
  require 'turnip/capybara'

  # Deviating from the convention a bit. spec/support houses things that aren't
  # so involved in each test (such as shared behaviors, which are now in
  # spec/shared). These include system-/framework-level modifications required
  # to allow the testing framework to operate properly. This includes stuff
  # like settings for the libraries required above.
  Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

  Rails.backtrace_cleaner.remove_silencers!

  RSpec.configure do |config|
    config.backtrace_clean_patterns << %r{gems/(acti|rspec|spork)}
    config.full_backtrace = false
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = true
    config.order = 'random'
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.resolve_lazy_configurations!
  end
end

def each_run
  ActiveSupport::Dependencies.clear
  RSpec.resolve_lazy_each_runs!
  # Now this is where shared behaviors, contexts, examples will go.
  Dir[File.expand_path('../shared/**/*.rb', __FILE__)].each { |f| require f }
  Dir.glob('spec/acceptance/steps/**/*_steps.rb') { |f| load f, true }
end



##
# ==== Code above this should not care if Spork is used or not.
#
def sporkless?
  return @sporkless unless @sporkless.nil?
  @sporkless = (begin; require 'spork'; rescue LoadError; nil end).nil? ||
                                        !(defined?(Spork) && Spork.using_spork?)
end

# Actual settings separated to .simplecov
def start_coverage
  return unless sporkless? # Something funny about numbers right now under spork
  require 'simplecov'
end

# Avoid changing below. Adjustments should typically be made up above.
if sporkless?
  start_coverage
  setup_environment
  each_run
else
  # require 'spork/ext/ruby-debug'
  Spork.prefork do
    ENV['DRB'] = 'true'
    setup_environment
    Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  end

  Spork.each_run do
    start_coverage
    each_run
  end
end
