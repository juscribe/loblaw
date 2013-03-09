# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/faq.html.erb' do
    it_renders_error_free
    its_got_some_bull

    it 'displays a header which says FAQ' do
      render
      expect(rendered).to have_xpath './/h1', text: 'Frequently Asked Questions'
    end

    it 'renders a questions wrapper' do
      render
      expect(rendered).to have_xpath './/*[@class="questions"]'
    end

    context 'when there are no questions'

    it 'renders a listing element' do
      render
      expect(rendered).to have_xpath './/*[@class="questions"]/li'
    end

    it 'renders a link to the specific item that is listed' do
      render
      expect(rendered).to have_xpath './/*[@class="questions"]/li//dt/a'
    end
  end
end
