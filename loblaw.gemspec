# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "loblaw/version"

Gem::Specification.new do |s|
  s.name        = "Loblaw"
  s.version     = Loblaw::VERSION
  s.authors     = ['caleon']
  s.email       = ['caleon@gmail.com']
  s.homepage    = 'https://github.com/caleon/loblaw'
  s.summary     = 'Directed Acyclic Graph-based communications'
  s.description = 'Directed Acyclic Graph-based communications'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency 'rails', '~> 3.2.12'
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
end
