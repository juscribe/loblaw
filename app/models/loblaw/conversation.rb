# encoding: utf-8

module Loblaw
  class Conversation < ActiveRecord::Base
    # belongs_to :starter, class_name: :User, inverse_of: :sparks
    has_many :messages, inverse_of: :conversation

    # paginates_per 20

    scope :sorted_on, ->(scheme) { reorder(_down_sort_for(scheme)).reverse_order }
    class << self
      private
      def _down_sort_for(scheme)
        case scheme
        when /activity/ then :messages_count
        when /latest/   then :updated_at
        else                 :id
        end
      end
    end

    # validates :mailbox_id, presence: true
    # attr_accessible :title, :body

    def to_s
      title
    end

    # def generate_token
    #   self.token = SecureRandom.base64[0...-2]
    # end

    def messages_count=(*)
    end
  end
end
