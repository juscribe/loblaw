# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe ConversationsController do

    describe 'GET index' do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'

      describe 'Sorting' do
        before { controller.should_receive(:get_conversations).and_call_original }
        let(:sort) { example.metadata[:sort] }
        let(:params) { { sort: sort } }

        after do
          mock_relation.should_receive(:reverse_order) { null_relation }
          make_request!
        end

        context 'by Default' do
          let(:params) { {} }
          it 'searches for the most recent activity' do
            klass.should_receive(:reorder).with(:id) { mock_relation }
          end
        end

        context 'by Activity', sort: 'activity' do
          it 'queries the table by a descending number of associated messages' do
            klass.should_receive(:reorder).with(:messages_count) { mock_relation }
          end
        end

        context 'by Latest', sort: 'latest' do
          it 'queries the table by a descending updated timestamp' do
            klass.should_receive(:reorder).with(:updated_at) { mock_relation }
          end
        end

        context 'by Unknown', sort: 'unknown' do
          it 'queries the table by default sort' do
            klass.should_receive(:reorder).with(:id) { mock_relation }
          end
        end

        context 'by Blank', sort: '' do
          it 'queries the table by default sort' do
            klass.should_receive(:reorder).with(:id) { mock_relation }
          end
        end
      end

      context 'when the number of activities' do
        context 'is 0' do
          it 'sets the displayed collection as empty' do
            controller.should_receive(:get_conversations) { klass.limit(0) }
            make_request!
            expect(assigns(:conversations)).to be_empty
          end
        end

        context 'is > 0' do
          it 'sets the displayed collection with records' do
            controller.should_receive(:get_conversations) { build_list(:conversation, 5) }
            make_request!
            expect(assigns(:conversations)).not_to be_empty
          end
        end
      end
    end

    describe 'GET show', action: :show, id: '271958' do
      include_examples 'Reachable actions'
      include_examples 'Default renderers'

      before do
        klass.stub(:order) { klass }
        klass.stub(:includes).with(:messages) { klass }
      end

      it 'searches for the record by the provided id' do
        klass.should_receive(:find).with('271958') { mock_record }
        make_request!
      end

      it 'sets @conversation to the found object' do
        make_request!
        expect(assigns(:conversation)).to be_a klass
      end

      context 'when there is not a record by the provided id' do
        before { klass.should_receive(:find).with('271958').and_raise(ActiveRecord::RecordNotFound) }

        it 'raises a record not found error' do
          expect { make_request! }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      it 'renders the show template correctly with associated messages' do
        mock_record.stub(:messages) { create_list(:message, 4) }
        make_request!
        expect(page).to have_rendered 'show'
      end
    end
  end
end
