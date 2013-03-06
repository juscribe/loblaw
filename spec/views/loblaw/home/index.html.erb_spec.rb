# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/index.html.erb' do
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

    it_renders_partial 'conversations/list'

  end
end
