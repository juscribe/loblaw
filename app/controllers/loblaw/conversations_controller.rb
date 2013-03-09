# encoding: utf-8
require_dependency "loblaw/application_controller"

module Loblaw
  class ConversationsController < ApplicationController

    def index
      params[:page] = [params[:page].to_i, 1].max
      @conversations = get_conversations
    end

    def show
      @conversation = Conversation.find(params[:id])
    end
  end
end
