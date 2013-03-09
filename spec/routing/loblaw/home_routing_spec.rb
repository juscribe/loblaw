# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'routes for Home' do

    it 'routes GET / to home#index' do
      expect(get: '/').to be_routable
      expect(get: '/').to route_to('loblaw/home#index')
    end

    it 'routes GET about to home#about' do
      expect(get: 'about').to be_routable
      expect(get: 'about').to route_to(controller: 'loblaw/home', action: 'about')
    end

    it 'routes GET contact to home#contact' do
      expect(get: 'contact').to be_routable
      expect(get: 'contact').to route_to(controller: 'loblaw/home', action: 'contact')
    end

    it 'routes GET faq to home#faq' do
      expect(get: 'faq').to be_routable
      expect(get: 'faq').to route_to(controller: 'loblaw/home', action: 'faq')
    end

    it 'routes GET help to the home#help' do
      expect(get: 'help').to be_routable
      expect(get: 'help').to route_to(controller: 'loblaw/home', action: 'help')
    end

    it 'routes GET terms to home#terms' do
      expect(get: 'terms').to be_routable
      expect(get: 'terms').to route_to(controller: 'loblaw/home', action: 'terms')
    end
  end
end
