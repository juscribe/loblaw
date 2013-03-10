# encoding: utf-8
require 'rails'
require 'active_support/dependencies'

module Loblaw

  mattr_accessor :app_root
  mattr_accessor :engine_name

  def self.setup
    yield self
  end

  autoload :Conversation, 'loblaw/conversation'
  autoload :Message, 'loblaw/message'
  # autoload :Mailbox, 'app/models/loblaw/mailbox'
  # autoload :Voice, 'app/models/loblaw/voice'
  # autoload :Attachment, 'app/models/loblaw/attachment'
  # autoload :Graph, 'app/models/loblaw/graph'
  # autoload :
  autoload :Model, 'loblaw/model'
end

require 'loblaw/engine'
require 'loblaw/version'
