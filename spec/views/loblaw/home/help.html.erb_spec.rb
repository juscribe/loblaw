# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/help.html.erb' do

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it 'displays a header which says Help' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Help'
    end

    it 'got some bull' do
      render
      expect(rendered).to have_content 'some bull'
    end

    it 'displays at least 4 sections' do
      render
      expect(rendered).to have_xpath('.//section/@class', text: /^section-home-help/, minimum: 4)
    end
  end
end
