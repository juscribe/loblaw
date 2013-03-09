# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'routes for Conversations' do

    it 'routes GET /conversations to the conversations controller' do
      expect(get: 'conversations').to be_routable
      expect(get: 'conversations').to route_to 'loblaw/conversations#index'
    end

    it 'routes GET /conversations/1 to the corresponding action' do
      expect(get: 'conversations/1').to be_routable
      expect(get: 'conversations/1').to route_to(controller: 'loblaw/conversations',
                                                     action: 'show', id: '1')
    end

    it 'routes GET /convesations/new to the corresponding action' do
      expect(get: 'conversations/new').to be_routable
      expect(get: 'conversations/new').to route_to 'loblaw/conversations#new'
    end

    it 'routes POST /conversations to the corresponding action' do
      expect(post: 'conversations').to be_routable
      expect(post: 'conversations').to route_to 'loblaw/conversations#create'
    end

    it 'routes GET /coversations/1/edit to the corresponding action' do
      expect(get: 'conversations/1/edit').to be_routable
      expect(get: 'conversations/1/edit').to route_to(controller: 'loblaw/conversations',
                                                          action: 'edit', id: '1')
    end

    it 'routes PUT /conversations/1 to the corresponding action' do
      expect(put: 'conversations/1').to be_routable
      expect(put: 'conversations/1').to route_to(controller: 'loblaw/conversations',
                                                     action: 'update', id: '1')
    end
  end
end
