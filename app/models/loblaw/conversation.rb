# encoding: utf-8
module Loblaw
  class Conversation < ActiveRecord::Base
    belongs_to :starter, class_name: :User, inverse_of: :sparks
    has_many :messages, inverse_of: :conversation

    # order('id DESC').limit(10).includes(:messages)
    scope :latest, ->(num = 10) { order('id DESC').limit(num).includes(:messages) }

    # validates :mailbox_id, presence: true
    # attr_accessible :title, :body

    def generate_token
      self.token = SecureRandom.base64[0...-2]
    end
  end
end
