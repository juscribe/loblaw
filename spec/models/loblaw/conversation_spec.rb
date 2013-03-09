# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe Conversation do
    let(:klass) { described_class }

    describe 'Scopes', scopes: true do
      let(:scoped) { klass.scoped }
      let(:scope) { example.metadata[:scope] || :scoped }
      let(:scope_args) { example.metadata[:args] || [] }

      def make_call!
        klass.__send__(scope, *scope_args)
      end

      after { make_call! unless example.metadata[:no_call] }

      describe '.sorted_on', scope: :sorted_on do
        # it 'represents correct setup' do
        #   klass.should == Conversation
        # end

        context 'when sort: :activity', args: [:activity] do

          it 'prioritizes the most number of messages' do
            any_relation.should_receive(:reorder).with(:messages_count) { null_relation }
          end
        end

        context 'when sort: :latest', args: [:latest] do

          it 'prioritizes the most recent updated_at column' do
            any_relation.should_receive(:reorder).with(:updated_at) { null_relation }
          end
        end

        context 'when sort: :gibberish', args: [:gibberish] do
          it 'uses default ID desc sorting' do
            any_relation.should_receive(:reorder).with(:id) { null_relation }
          end
        end

        context 'when sort: nil', args: [nil] do
          it 'uses default ID desc sorting' do
            any_relation.should_receive(:reorder).with(:id) { null_relation }
          end
        end
      end

      # describe '.latest', scope: :latest do
      #   before do
      #     [:order, :limit, :includes].each do |skope|
      #       any_relation.stub(skope) { scoped }
      #     end
      #   end

      #   it 'calls the order scope to sort by reverse id' do
      #     any_relation.should_receive(:order).with('id DESC')
      #   end

      #   it 'limits the result to 10 items by default' do
      #     any_relation.should_receive(:limit).with(10)
      #   end

      #   it 'preloads related messages as needed' do
      #     any_relation.should_receive(:includes).with(:messages)
      #   end

      #   context 'specifying 10 (the same as default)', arg: 10 do
      #     it 'limits the result to 10 items' do
      #       any_relation.should_receive(:limit).with(10)
      #     end
      #   end

      #   context 'specifying 5 (less than the default)', args: 5 do
      #     it 'limits the result to 5 items' do
      #       any_relation.should_receive(:limit).with(5)
      #     end
      #   end

      #   context 'specifying 12 (more than the default)', args: 12 do
      #     it 'limits the result to 12 items' do
      #       any_relation.should_receive(:limit).with(12)
      #     end
      #   end

      #   context 'specifying nil', args: nil do
      #     it 'limits the result to 10 items' do
      #       any_relation.should_receive(:limit).with(10)
      #     end
      #   end

      #   context 'specifying somefin bizarre', args: {} do
      #     it 'limits the result to 10 items' do
      #       any_relation.should_receive(:limit).with(10)
      #     end
      #   end
      # end
    end

    describe '#messages_count' do
      it { should respond_to :messages_count }
      it { should respond_to :messages_count= }

      it 'ignores explicit setting of messages_count attribute' do
        expect { subject.messages_count = 20 }.not_to change(subject, :messages_count)
      end

      it 'is the cached equivalent of its number of associated messages' do
        expect(subject.messages_count).to eq subject.messages.count
      end
    end

    describe '#updated_at' do
      before(:all) { @message = create(:message) }
      after(:all) { @message.conversation.delete; @message.delete }
      let(:message) { @message }
      let(:conversation ) { message.conversation }

      it 'has persisted setups' do
        expect(conversation).to be_persisted
        expect(message).to be_persisted
      end

      it 'gets auto updated when its messages are created or destroyed' do
        expect { create(:message, conversation: conversation) }.to change(conversation, :updated_at)
      end
    end
  end
end
