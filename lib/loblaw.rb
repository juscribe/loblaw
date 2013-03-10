# encoding: utf-8
require 'kaminari'
require 'modernizr-rails'
require 'bootstrap-sass'
require 'active_support/dependencies'

module Loblaw

  autoload :Model, 'loblaw/model'
end

require 'loblaw/engine'
require 'loblaw/version'
