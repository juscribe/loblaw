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

      describe '.latest', scope: :latest do
        before do
          [:order, :limit, :includes].each do |skope|
            any_relation.stub(skope) { scoped }
          end
        end

        it 'calls the order scope to sort by reverse id' do
          any_relation.should_receive(:order).with('id DESC')
        end

        it 'limits the result to 10 items by default' do
          any_relation.should_receive(:limit).with(10)
        end

        it 'preloads related messages as needed' do
          any_relation.should_receive(:includes).with(:messages)
        end

        context 'specifying 10 (the same as default)', arg: 10 do
          it 'limits the result to 10 items' do
            any_relation.should_receive(:limit).with(10)
          end
        end

        context 'specifying 5 (less than the default)', args: 5 do
          it 'limits the result to 5 items' do
            any_relation.should_receive(:limit).with(5)
          end
        end

        context 'specifying 12 (more than the default)', args: 12 do
          it 'limits the result to 12 items' do
            any_relation.should_receive(:limit).with(12)
          end
        end

        context 'specifying nil', args: nil do
          it 'limits the result to 10 items' do
            any_relation.should_receive(:limit).with(10)
          end
        end

        context 'specifying somefin bizarre', args: {} do
          it 'limits the result to 10 items' do
            any_relation.should_receive(:limit).with(10)
          end
        end
      end
    end
  end
end
