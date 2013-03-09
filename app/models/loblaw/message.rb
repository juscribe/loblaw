# encoding: utf-8

module Loblaw
  class Message < ActiveRecord::Base
    serialize :reference_ids

    belongs_to :voice, inverse_of: :messages
    belongs_to :conversation, counter_cache: true, inverse_of: :messages,
                              touch: true

    # with_options class_name: :Mailbox do |m|
    #   m.belongs_to :outbound_mailbox, inverse_of: :outbound_messages
    #   m.belongs_to :inbound_mailbox, inverse_of: :inbound_messages
    # end

    has_many :attachments, inverse_of: :message

    attr_accessible :subject, :body

  end
end

require 'loblaw/message/errors'
require 'loblaw/message/flags'
require 'loblaw/message/notifications'
