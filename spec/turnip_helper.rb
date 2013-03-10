# encoding: utf-8

module Loblaw

  module Spoofers

    def spoof_conversations(num)
      Conversation.count.should eq 0
      @conversations = Conversation.where(id: create_list(:conversation, num).map(&:id))
      ApplicationController.any_instance.stub(:get_conversations) { @conversations.page(1).per(10) }

      Conversation.stub_chain(:includes, :find).with(any_args) { @conversations.first || raise(::ActiveRecord::RecordNotFound).new }
    end

    def spoof_messages_on_conversations(num)
      @messages = create_list(:message, num)
      Conversation.any_instance.stub(:messages) { @messages }

      # Conversation.all.each do |conversation|
      #   create_list(:message, num, conversation: conversation)
      # end
    end
  end
end

RSpec.configure do |config|
  config.include Loblaw::Spoofers
end

Dir.glob('spec/acceptance/steps/**/*_steps.rb') { |f| load f, true }

require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    js_errors: !ENV['CI'],
    # logger: ..., # Something that responds to #puts
    # phantomjs_logger: nil, # for master, not 1.0.2
    # debug: true,
    # inspector: true,
    # extensions: [], # Preloaded scripts to stub APIs, for ex.
    phantomjs_options: [
      '--load-images=yes',
      # '--local-to-remote-url-access=no', # Turning this off coincided with greens
      '--ignore-ssl-errors=yes',
      '--web-security=no'
    ]
  # The following binary is for my local build MacOSX, which matches the
  # phantomjs version of what is used by Circle.
  }.merge(File.exist?(File.expand_path('../../bin/phantomjs', __FILE__)) ?
         { phantomjs: File.expand_path('../../bin/phantomjs', __FILE__) } : {}))
end
Capybara.javascript_driver = :poltergeist
# Capybara.javascript_driver = :selenium
