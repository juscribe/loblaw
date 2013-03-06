# encoding: utf-8
module Loblaw
  class Voice < ActiveRecord::Base
    belongs_to :owner,  inverse_of: :voices, class_name: :User
    belongs_to :graph,  inverse_of: :voices
    has_many :messages, inverse_of: :voice

    # has_many :expressions
    # attr_accessible :title, :body
  end
end
