# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/show' do
    let(:num) { 5 }
    let(:conversation) { create(:conversation_with_5_messages) }
    it_renders_partial 'messages/message'

    before do
      conversation.stub(to_s: 'convoname', description: 'desc')

      assign(:conversation, conversation)
      assign(:messages, conversation.messages)
    end

    it 'has the conversation name in its main heading' do
      render
      expect(rendered).to have_css('.section-main > header > h1', text: 'convoname')
    end

    it 'has the conversation header info at top' do
      # conversation.stub(description: 'desc')
      render
      expect(rendered).to have_css('.section-main > header > h1 + p', text: 'desc')
    end
  end
end
