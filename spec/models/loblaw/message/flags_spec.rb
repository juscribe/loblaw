# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe Message, 'Flags' do
    include_context 'Message setup'

    status_syms = Message::STATUSES.values

    specify 'STATUSES has 5 defined flags' do
      status_syms.should have(5).items
      status_syms.should =~ [:sent, :read, :starred, :spam, :trashed]
    end

    describe 'hidden status flag setters' do
      status_syms.each do |status|
        it "privatizes the :#{status}= method" do
          expect { instance_eval "message.#{status} = true" }.to raise_error NoMethodError
        end
      end
    end

    describe 'initial status flags' do
      it { should be_draft }
      it { should_not be_sent }
      it { should_not be_read }
      it { should_not be_starred }
      it { should_not be_spam }
      it { should_not be_trashed }
    end

    describe '#draft?' do
      it 'returns false if #sent? is true' do
        message.stub(sent?: true)
        expect(message).not_to be_draft
      end

      it 'returns true if #sent? is false' do
        message.stub(sent?: false)
        expect(message).to be_draft
      end
    end

    describe '#unread?' do
      it 'returns false if #read? is true' do
        message.stub(read?: true)
        expect(message).not_to be_unread
      end

      it 'returns true if #read? is false' do
        message.stub(read?: false)
        expect(message).to be_unread
      end
    end

    describe 'form-accessible setters' do

      describe '#mark_as_sent' do
        it { should respond_to :mark_as_sent }
        it { should respond_to :mark_as_sent= }
        its(:sent?) { should be_false }

        it 'allows initialization by proxy' do
          expect(Message.new(mark_as_sent: true)).to be_sent
        end

        it 'allows assignment by proxy' do
          expect { message.assign_attributes(:mark_as_sent => true) }.not_to raise_error
          expect(message).to be_sent
        end
      end

      status_syms.each do |status|
        next if status == :sent
        base_method_sym = :"mark_as_#{status}"
        predicate_sym = :"#{status}?"

        describe "##{base_method_sym}" do
          it { should respond_to base_method_sym }
          its(predicate_sym) { should be_false }

          context 'when not sent yet' do
            it 'disregards initialization by proxy' do
              expect(Message.new(base_method_sym => true)).not_to send(:"be_#{status}")
            end

            it 'disregards setting by proxy' do
              expect { message.send(:"#{base_method_sym}=", true) }.not_to change(message, predicate_sym)
            end

            it 'disregards assignment by proxy' do
              expect { message.assign_attributes(base_method_sym => true) }.not_to change(message, predicate_sym)
            end
          end

          context 'when already flagged as sent' do
            before { Message.any_instance.stub(sent?: true, :recipient= => true) }

            it 'allows initialization by proxy' do
              expect(Message.new(base_method_sym => true)).to send(:"be_#{status}")
            end

            it 'allows setting by proxy' do
              expect { message.send(:"#{base_method_sym}=", true) }.to change(message, predicate_sym).from(false).to(true)
            end

            it 'allows assignment by proxy' do
              expect { message.assign_attributes(base_method_sym => true) }.to change(message, predicate_sym).from(false).to(true)
            end
          end
        end
      end # /status_syms.each

    end

    context 'during #save' do
      it 'does not change the status (to "sent", for instance)' do
        expect { message.save }.not_to change(message, :status)
      end
    end

    context 'after #save' do
      let(:saved_message) { message.save; message.reload }
      subject { saved_message }

      it { should be message }    # same object as before
      it { should be_persisted }  # saved properly in database

      describe 'saved as draft status flags' do
        it { should be_draft }
        it { should_not be_sent } # important!
        it { should_not be_read }
        it { should_not be_starred }
        it { should_not be_spam }
        it { should_not be_trashed }
      end
    end
  end
end
