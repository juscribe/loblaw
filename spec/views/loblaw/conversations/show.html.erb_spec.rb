# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/show' do
    let(:num) { example.metadata[:num] || 5 }
    let(:conversation) { create(:conversation, messages_count: num) }
    it_renders_partial 'messages/message'

    before do
      conversation.stub(to_s: 'convoname', description: 'desc')
      assign(:conversation, conversation)
      assign(:messages, conversation.messages)
      render
    end

    it 'has the conversation name in its main heading' do
      expect(rendered).to have_css('article > header > h1', text: 'convoname')
    end

    it 'has the conversation header info at top' do
      expect(rendered).to have_css('article > header > h1 + .description', text: 'desc')
    end

    it 'has one node encompassing the entirety of its contents' do
      expect(rendered).to have_xpath('./*', count: 1)
    end
  end
end
