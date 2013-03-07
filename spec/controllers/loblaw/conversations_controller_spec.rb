# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe ConversationsController do

    describe 'GET index' do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'

      it 'searches for the most recent activity' do
        klass.should_receive(:latest).with(10).and_call_original
        make_request!
      end

      context 'when there is no activity' do

        it 'sets the displayed collection as empty' do
          klass.stub(:latest) { klass.null_relation }
          make_request!
          expect(assigns(:conversations)).to be_empty
        end
      end

      context 'when there is some activity' do

        it 'sets the displayed collection with records' do
          klass.stub(:latest) { create_list(:loblaw_conversation, 5) }
          make_request!
        end
      end
    end

    describe 'GET show', action: :show do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'

      it 'searches for the record by the provided id' do
        klass.should_receive(:find) { mock_record }
        make_request!
      end

      it 'sets @conversation to the found object' do
        make_request!
        expect(assigns(:conversation)).to be_a klass
      end

      context 'when there is not a record by the provided id' do
        before { klass.should_receive(:find).and_raise(ActiveRecord::RecordNotFound) }

        it 'raises a record not found error' do
          expect { make_request! }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end