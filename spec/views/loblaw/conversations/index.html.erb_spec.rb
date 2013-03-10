# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/index' do
    it_renders_partial 'conversations/list'

    it 'does not display a welcome message' do
      render
      expect(rendered).not_to have_content 'Welcome to Loblaw'
    end
  end
end
