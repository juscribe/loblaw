# encoding: utf-8

Dir.glob('spec/acceptance/steps/**/*steps.rb') { |f| load f, true }
