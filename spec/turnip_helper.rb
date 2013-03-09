# encoding: utf-8

module Loblaw

  module Spoofers

    def spoof_conversations(num)
      Conversation.count.should eq 0
      @conversations = Conversation.where(id: create_list(:conversation, num).map(&:id))
      ApplicationController.any_instance.stub(:get_conversations) { @conversations.page(1) }
    end

    def spoof_messages_on_conversations(num)
      Conversation.all.each do |conversation|
        conversation.messages = create_list(:message, num)
      end
    end
  end
end

RSpec.configure do |config|
  config.include Loblaw::Spoofers
end

Dir.glob('spec/acceptance/steps/**/*_steps.rb') { |f| load f, true }
