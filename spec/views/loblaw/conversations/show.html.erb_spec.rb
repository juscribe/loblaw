# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/show' do
    let(:num) { 5 }
    let(:conversation) { create(:conversation_with_5_messages) }
    it_renders_partial 'messages/message'

    before do
      assign(:conversation, conversation)
      assign(:messages, conversation.messages)
    end

    it 'has the conversation name in its main heading' do

    end

    it 'has the conversation header info at top' do

    end
  end
end
