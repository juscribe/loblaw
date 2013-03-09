# encoding: utf-8

module Loblaw
  class ApplicationController < ActionController::Base
    class_attribute :per_page, instance_writer: true
    self.per_page = 10
    helper :all

  end
end
