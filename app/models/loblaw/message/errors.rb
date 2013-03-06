# encoding: utf-8
module Loblaw
  class Message < ActiveRecord::Base
    class Error < ::StandardError; end
    class LockedError < Error; end
    class    SenderLockedError < LockedError; end
    class RecipientLockedError < LockedError; end
  end
end
