# encoding: utf-8

module Loblaw
  class ApplicationController < ActionController::Base

    private
    def get_conversations
      @conversations = Conversation.sorted_on(params[:sort]).page(params[:page]).per(10)
    end
  end
end
