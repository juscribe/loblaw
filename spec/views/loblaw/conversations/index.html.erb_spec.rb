# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/index' do
    before(:all) { @conversations = create_list(:conversation, 5) }
    before { assign(:conversations, conversations) }

    let(:conversations) { @conversations }

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it_renders_partial 'conversations/list'
  end
end