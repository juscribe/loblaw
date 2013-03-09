# encoding: utf-8

module Loblaw
  class ApplicationController < ActionController::Base
    class_attribute :per_page, instance_writer: true
    self.per_page = 10
    helper :all


    private
    def get_conversations
      @conversations = Conversation.order(:id).reverse_order.page(params[:page]).per(10)
    end
  end
end
