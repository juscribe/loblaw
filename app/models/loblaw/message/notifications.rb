# encoding: utf-8

module Loblaw
  class Message < ActiveRecord::Base
    before_save :determine_notifications
    after_save :deliver_message_notifications, if: :notifying_recipient?

    private
    def determine_notifications
      @_is_newly_sent = sent_changed? && sent?
      true
    end

    def notifying_recipient?
      !!@_is_newly_sent
    end

    def deliver_message_notifications
      # Notifier.deliver_message_notification(self)
    end
  end
end
