# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/help.html.erb' do
    it_renders_error_free
    its_got_some_bull

    it 'displays a header which says Help' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Help'
    end

    it 'displays at least 4 sections' do
      render
      expect(rendered).to have_xpath('.//section/@class', text: /^section-home-help/, minimum: 4)
    end
  end
end
