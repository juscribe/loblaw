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
  s.add_runtime_dependency 'rails', '~> 3.2.12'
  s.add_runtime_dependency 'flag_shih_tzu'
  s.add_runtime_dependency 'significance'
  # s.add_dependency 'personhood'
  # s.add_dependency 'mini_magick'
  # s.add_dependency 'carrierwave'
  s.add_runtime_dependency 'jquery-rails'
  s.add_runtime_dependency 'jquery-ui-rails'
  s.add_runtime_dependency 'modernizr-rails'
  s.add_runtime_dependency 'sass-rails', '~> 3.2'
  s.add_runtime_dependency 'bootstrap-sass', '~> 2.3.0.1'
  s.add_runtime_dependency 'kaminari', '~> 0.14.1'
end

# -rw-r--r--  1 colin  staff  9527808 Mar  9 11:09 loblaw-0.0.1.gem


