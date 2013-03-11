# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/help.html.erb' do
    before { render }
    it_renders_error_free
    its_got_some_bull
    it_displays_header 'Help'

    let(:tree) { ['.', {
        list: '//section/@class'
      }]}

    it 'displays at least 4 sections' do
      expect_xpath :list, text: /^section-home-help/, minimum: 4
    end
  end
end
