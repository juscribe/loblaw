# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/terms.html.erb' do
    before { render }
    it_renders_error_free
    its_got_some_bull
    it_displays_header 'Terms of Service'

    let(:tree) { ['.', {
        list: ['//*[@class="terms"]', {
            item: '/p'
          }]
      }] }

    it 'renders a terms wrapper' do
      expect_xpath :list
    end

    it 'renders a listing element' do
      expect_xpath :list, :item
    end
  end
end
