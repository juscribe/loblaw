# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe HomeController do

    describe 'GET index' do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end

    describe 'GET about', action: :about do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end

    describe 'GET contact', action: :contact do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end

    describe 'GET faq', action: :faq do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end

    describe 'GET help', action: :help do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end

    describe 'GET terms', action: :terms do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'
    end
  end
end
