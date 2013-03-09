# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/terms.html.erb' do
    it_renders_error_free
    its_got_some_bull

    it 'displays a header which says Terms of Service' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Terms of Service'
    end

    it 'renders a terms wrapper' do
      render
      expect(rendered).to have_xpath './/*[@class="terms"]'
    end

    it 'renders a listing element' do
      render
      expect(rendered).to have_xpath './/*[@class="terms"]/p'
    end
  end
end
