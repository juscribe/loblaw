# encoding: utf-8
require_dependency "loblaw/application_controller"

module Loblaw
  class HomeController < ApplicationController

    def index
      @conversations = Conversation.latest(per_page)
    end

    def about

    end

    def contact

    end

    def faq

    end
  end
end
