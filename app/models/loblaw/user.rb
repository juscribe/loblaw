# encoding: utf-8
module Loblaw
  class User < ActiveRecord::Base
    has_many :voices, inverse_of: :user
    has_many :graphs, through: :voices

    has_many :messages, inverse_of: :user
    has_many :conversations, through: :messages#, inverse_of :converser?
    has_many :sparks, class_name: :Conversation, foreign_key: :initiater_id
    # attr_accessible :first_name, :last_name
  end
end
