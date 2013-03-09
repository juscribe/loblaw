# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/index.html.erb' do
    it_renders_partial 'conversations/list'

    it 'displays a welcome message' do
      render
      expect(rendered).to have_content 'Welcome to Loblaw'
    end
  end
end
