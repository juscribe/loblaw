# encoding: utf-8
module Loblaw
  class ApplicationController < ActionController::Base
    class_attribute :per_page
    self.per_page = 10

  end
end
