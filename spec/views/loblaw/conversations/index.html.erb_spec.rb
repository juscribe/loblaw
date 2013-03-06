# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe "loblaw/conversations/index" do
    before(:all) { @conversations = FactoryGirl.create_list(:conversation, 5) }
    before { assign(:conversations, conversations) }

    let(:conversations) { @conversations }

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it 'displays a welcome message' do
      render
      expect(rendered).to have_content 'Welcome to Loblaw'
    end

    it 'renders a listing wrapper' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]'
    end

    context 'when there is no activity' do
      let(:conversations) { Conversation.null_relation }

      it 'does not render a listing element' do
        render
        expect(rendered).not_to have_xpath './/*[@class="conversations"]/li'
      end
    end

    it 'renders a listing element' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]/li'
    end

    it 'renders a link to the specific item that is listed' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]/li/a[@href]'
    end
  end
end
