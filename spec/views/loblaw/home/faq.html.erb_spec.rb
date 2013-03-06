# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/faq.html.erb' do

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it 'displays a header which says FAQ' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Frequently Asked Questions'
    end

    it 'got some bull' do
      render
      expect(rendered).to have_content 'some bull'
    end
  end
end
