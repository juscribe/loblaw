# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'routes for Home' do

    it 'routes / to the home controller' do
      expect(get: '/').to be_routable
      expect(get: '/').to route_to('loblaw/home#index')
    end

    it 'routes about to the corresponding action' do
      expect(get: 'about').to be_routable
      expect(get: 'about').to route_to(controller: 'loblaw/home', action: 'about')
    end

    it 'routes contact to the corresponding action' do
      expect(get: 'contact').to be_routable
      expect(get: 'contact').to route_to(controller: 'loblaw/home', action: 'contact')
    end

    it 'routes faq to the corresponding action' do
      expect(get: 'faq').to be_routable
      expect(get: 'faq').to route_to(controller: 'loblaw/home', action: 'faq')
    end

    it 'routes help to the corresponding action' do
      expect(get: 'help').to be_routable
      expect(get: 'help').to route_to(controller: 'loblaw/home', action: 'help')
    end

    it 'routes terms to the corresponding action' do
      expect(get: 'terms').to be_routable
      expect(get: 'terms').to route_to(controller: 'loblaw/home', action: 'terms')
    end
  end
end
