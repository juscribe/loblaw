# encoding: utf-8

module Loblaw
  module ConversationsHelper

    def per_page
      ConversationsController.per_page
    end

    def current_page_number
      [params[:page].to_i, 1].max
    end
  end
end
