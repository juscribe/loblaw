# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'loblaw/version'

Gem::Specification.new do |s|
  s.name        = 'loblaw'
  s.version     = Loblaw::VERSION
  s.authors     = ['caleon']
  s.email       = ['caleon@gmail.com']
  s.homepage    = 'https://github.com/caleon/loblaw'
  s.summary     = 'Directed Acyclical Graph for communication'
  s.description = 'Directed Acyclical Graph for communication'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency 'rails', '~> 3.2.12'
  s.add_dependency 'flag_shih_tzu'
  s.add_dependency 'significance'
  s.add_dependency 'personhood'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave'
  s.add_dependency 'therubyracer'
  s.add_dependency 'libv8'
  s.add_dependency 'uglifier', '>= 1.0.3'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'modernizr-rails'
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'bootstrap-sass', '~> 2.3.0.1'
  s.add_dependency 'kaminari', '~> 0.14.1'
  s.add_dependency 'thin'
  s.add_dependency 'quiet_assets'

  s.add_development_dependency 'turnip'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'jasmine'
  s.add_development_dependency 'jasmine-rails'
  s.add_development_dependency 'jasmine-headless-webkit'
  s.add_development_dependency 'email_spec'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'growl_notify'
  s.add_development_dependency 'ruby_gntp'
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'simplecov'

  s.add_development_dependency 'better_errors'
  s.add_development_dependency 'binding_of_caller'
  s.add_development_dependency 'meta_request'
  s.add_development_dependency 'quiet_assets'
end
