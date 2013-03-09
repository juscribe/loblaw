# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/about.html.erb' do
    it_renders_error_free
    its_got_some_bull

    it 'displays a header which says About' do
      render
      expect(rendered).to have_xpath './/h1', text: 'About'
    end
  end
end
