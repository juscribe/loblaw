# encoding: utf-8

module Loblaw
  class ApplicationController < ActionController::Base

    around_filter :set_time_zone
    before_filter :set_layout_name
    layout :set_layout
    # helper 'loblaw/application'

    helper_method :app_name
    def app_name
      Loblaw.engine_name || 'Untitleeeeee'
    end

    protected
    def set_time_zone
      old_time_zone = Time.zone
      # Time.zone = current_user.try(:time_zone) || Time.zone_default
      yield
    ensure
      Time.zone = old_time_zone
    end

    def set_layout
      'loblaw/application'
    end

    def set_layout_name
      @layout_name = _layout.to_s
    end

    private
    def get_conversations
      @conversations = Conversation.sorted_on(params[:sort]).page(params[:page]).per(10)
    end
  end
end
