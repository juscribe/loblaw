# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/home/contact.html.erb' do
    before { render }
    it_renders_error_free
    its_got_some_bull
    it_displays_header 'Contact'
  end
end
