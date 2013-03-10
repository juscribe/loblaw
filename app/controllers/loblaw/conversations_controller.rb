# encoding: utf-8
require_dependency "loblaw/application_controller"

module Loblaw
  class ConversationsController < ApplicationController

    def index
      @conversations = get_conversations
    end

    def show
      @conversation = Conversation.includes(:messages).find(params[:id])
      @messages = @conversation.messages
    end
  end
end
