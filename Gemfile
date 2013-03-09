source "https://rubygems.org"

gemspec

gem "jquery-rails"

group :development, :test do
  gem 'sqlite3'
  # gem 'sprockets'
  # gem 'rails-i18n'
  gem 'rspec-rails', '~> 2.13.0', github: 'caleon/rspec-rails', require: false#,
                                  # path: '/Users/colin/Projects/gems/rspec-rails'
  gem 'quiet_assets'
  gem 'thin'

  gem 'turnip'
  gem 'capybara'
  gem 'poltergeist'
  gem 'jasmine'
  gem 'jasmine-rails'
  gem 'email_spec'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

group :development do
  gem 'jasmine-headless-webkit'
  gem 'growl'
  # gem 'growl_notify'
  gem 'ruby_gntp'
  gem 'rb-fsevent', '~> 0.9', require: false
  gem 'spork'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-jasmine-headless-webkit'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request' # https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US
end
