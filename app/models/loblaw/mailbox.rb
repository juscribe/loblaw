# encoding; utf-8

module Loblaw
  class Mailbox < ActiveRecord::Base
    serialize :blocked_mailbox_ids

    belongs_to :mailboxable, polymorphic: true, inverse_of: :mailbox

    # with_options class_name: 'Message' do |m|
    #   m.has_many :outbound_messages,  foreign_key: 'outbound_mailbox_id',
    #                                    inverse_of: :outbound_mailbox
    #   m.has_many     :sent_messages,  foreign_key: 'outbound_mailbox_id',
    #                                    conditions: Message.sent_condition
    #   m.has_many    :draft_messages,  foreign_key: 'outbound_mailbox_id',
    #                                    conditions: "`messages`.`status` IS NULL OR #{Message.not_sent_condition}"
    #   m.has_many  :inbound_messages,  foreign_key:  'inbound_mailbox_id',
    #                                    inverse_of: :inbound_mailbox
    #   m.has_many          :messages,  foreign_key:  'inbound_mailbox_id',
    #                                    conditions: Message.sent_condition
    # end

    validates :mailboxable_id, uniqueness: { scope: :mailboxable_type }

    # attr_accessible :title, :body
  end
end
