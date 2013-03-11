# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/faq.html.erb' do
    before { render }
    it_renders_error_free
    its_got_some_bull
    it_displays_header 'Frequently Asked Questions'

    let(:tree) { ['.', {
      list: ['//*[@class="questions"]', {
          item: ['/li', {
              link: '//dt/a'
            }]
          }]
        }] }

    it 'renders a questions wrapper' do
      expect_xpath :list
    end

    context 'when there are no questions' do
    end

    it 'renders a listing element' do
      expect_xpath :list, :item
    end

    it 'renders a link to the specific item that is listed' do
      expect_xpath :list, :item, :link
    end
  end
end
