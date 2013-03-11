# encoding: utf-8
require_dependency "loblaw/application_controller"

module Loblaw
  class HomeController < ApplicationController

    def index
      @conversations = get_conversations
    end

    def about

    end

    def contact

    end

    def faq

    end

    private
    def get_conversations
      @conversations = super.per(10)
    end
  end
end
