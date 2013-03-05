# encoding: utf-8
module Loblaw::ORM # :nodoc:

  module ActiveRecord # :nodoc:

    def blaw(*names)
      include Loblaw::Model
      class_attribute :loblaw_types, instance_writer: false
      self.loblaw_types = Array.wrap(names).map(&:to_sym)
    end
  end
end

ActiveRecord::Base.extend Loblaw::ORM::ActiveRecord
