# encoding: utf-8
module Loblaw
  class Graph < ActiveRecord::Base
    has_many :voices, inverse_of: :graph
    # attr_accessible :title, :body
  end
end
