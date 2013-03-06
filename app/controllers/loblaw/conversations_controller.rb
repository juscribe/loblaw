# encoding: utf-8
require_dependency "loblaw/application_controller"

module Loblaw
  class ConversationsController < ApplicationController

    def index
      @conversations = Conversation.latest(10)
    end

    def show
      @conversation = Conversation.find(params[:id])
    end
  end
end
