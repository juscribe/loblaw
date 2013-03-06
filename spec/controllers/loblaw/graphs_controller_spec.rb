# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe GraphsController do

    # def request_action!(*args)
    #   get :index, use_route: :loblaw
    # end

    # it 'has a validly reachable homepage' do
    #   expect { request_action! }.not_to raise_error
    # end

    # it 'renders the correct template' do
    #   request_action!
    #   expect(page).to have_rendered 'index'
    # end

    # it 'searches for the most recent activity' do
    #   Voice.should_receive(:order).with(:id).and_call_original
    #   request_action!
    # end

    # it 'searches for just the latest 10' do
    #   ActiveRecord::Relation.any_instance.should_receive(:limit).with(10).and_call_original
    #   request_action!
    # end

    # context 'when there is no activity' do

    #   it 'sets the displayed collection as empty' do
    #     Graph.stub(:all) { Graph.null_relation }
    #     request_action!
    #     expect(assigns(:graphs)).to be_empty
    #   end
    # end

    # context 'when there is some activity' do

    #   it 'sets the displayed collection with records' do
    #     Graph.stub(:all) { Array.new(5, mock_model(Graph)) }
    #     request_action!
    #   end
    # end
  end
end
