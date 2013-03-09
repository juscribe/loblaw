# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe Model do
    include_context 'Message setup'

    it { expect(described_class).to be_a Module }

    before(:all) do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.create_table :mailboxable_things do |t|
        t.string :name
      end
    end

    after(:all) do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.drop_table :mailboxable_things
    end

    class MailboxableThing < ActiveRecord::Base
      include ::Loblaw::Model
    end

    let(:thing1)  { MailboxableThing.new }
    let(:thing2)  { MailboxableThing.new }
    let(:thing)   { thing1 }

    # describe 'MailboxableThing object' do
    #   subject { thing1 }

    #   its('class.included_modules') { should include ActiveRecord::Mailboxable }

    #   describe '#mailbox' do
    #     # it { should respond_to :mailbox_without_autocreate }
    #     # it { should respond_to :mailbox_with_autocreate }
    #     it { should respond_to :mailbox }

    #     it 'creates a new mailbox object if none exists' do
    #       expect { thing.mailbox }.to change(Mailbox, :count).by(1)
    #       expect { thing.mailbox }.not_to change(Mailbox, :count)
    #     end
    #   end

    #   describe '#outbound_messages' do
    #     it { should respond_to :outbound_messages }

    #     it 'uses a different SQL than #inbound_messages' do
    #       expect(thing.outbound_messages.to_sql).not_to eq thing.inbound_messages.to_sql
    #     end
    #   end

    #   describe '#inbound_messages' do
    #     it { should respond_to :inbound_messages }
    #   end

    #   describe '#messages' do
    #     it { should respond_to :messages }

    #     it 'uses a different SQL than #inbound_messages' do
    #       expect(thing.messages.to_sql).not_to eq thing.inbound_messages.to_sql
    #     end
    #   end
    # end

    describe 'Transmission between two Mailboxable objects' do
      # let(:sender)    { thing1 }
      # let(:recipient) { thing2 }
      subject { message }

      it { should be_a Message }

      # its(:sender) { should == thing1 }
      # its(:recipient) { should == recipient }
      # its(:outbound_mailbox) { should == sender.mailbox }
      # its(:inbound_mailbox) { should == recipient.mailbox }

      it { should be_valid }

      context 'when saved as a draft' do
        before { message.save }

        it { should be_persisted }
        it { should_not be_sent }
        it { should be_draft }

        # its(:outbound_mailbox_id) { should == sender.mailbox.id }
        # its(:outbound_mailbox) { should == sender.mailbox }

        # it "is one of sender's outbound_messages" do
        #   sender.outbound_messages.should include message
        # end

        # it "is NOT one of sender's sent_messages" do
        #   sender.sent_messages.should_not include message
        # end

        # it "is one of sender's draft_messages" do
        #   sender.draft_messages.should include message
        # end

        # its(:inbound_mailbox_id) { should == recipient.mailbox.id }
        # its(:inbound_mailbox) { should == recipient.mailbox }

        # it "is one of recipient's inbound_messages" do
        #   # recipient.reload.inbound_messages(true).should include message
        #   # Needs to take into account recipient which is a mock_model('User')
        # end

        # it "is NOT one of recipient's messages" do
        #   recipient.messages.should_not include message
        # end
      end
    end
  end
end
