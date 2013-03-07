# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/terms.html.erb' do

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it 'displays a header which says Terms of Service' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Terms of Service'
    end

    it 'got some bull' do
      render
      expect(rendered).to have_content 'some bull'
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
