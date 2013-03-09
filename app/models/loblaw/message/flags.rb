# encoding: utf-8

module Loblaw
  class Message < ActiveRecord::Base
    class IrreversibleFlagError < Message::Error; end

    STATUSES  = {
         sent: 1,
         read: 2,
      starred: 3,
         spam: 4,
      trashed: 5
    }.invert.freeze

    require 'flag_shih_tzu'
    include FlagShihTzu
    has_flags STATUSES.merge(column: 'status')
    private *STATUSES.values.map { |status| :"#{status}=" }

    # TODO: change status column to have a default integral value associated with "new"
    # Update to above: Don't know if "new?" status is worth exploring apart from "unread?"

    STATUSES.values.each do |status|
      private_method_sym = :"#{status}="
         mark_method_sym = :"mark_as_#{status}"

      if status == :sent
        def mark_as_sent(value = true)
          __send__(:sent=, !!value) if value # I think this was because you can't unsend.
        end
      else
        # Only markable as one of the following flags from the point of view of a
        # recipient... but then what happens if a message goes to multiple recipients?
        define_method mark_method_sym do |value = true|
          self.__send__(private_method_sym, !!value) if value && sent?
        end
      end

      alias_method   :"#{mark_method_sym}=",   mark_method_sym

      attr_accessible mark_method_sym
    end

    def draft?
      !sent?
    end

    def unread?
      !read?
    end
  end
end
