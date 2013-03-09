#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title    = 'Loblaw'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')

end

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

# Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each { |f| load f }

require 'rspec/core'
require 'rspec/core/rake_task'
require 'rspec/rails'
load 'rspec/rails/tasks/rspec.rake'

# Handled in forked rspec-rails taks
# desc 'Run all specs in spec directory (excluding plugin specs)'
# RSpec::Core::RakeTask.new(:'test:prepare' => 'app:db:test:prepare')
task 'test:prepare' => 'app:db:test:prepare'
# task :default => :spec

Bundler::GemHelper.install_tasks

