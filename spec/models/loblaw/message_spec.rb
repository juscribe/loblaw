# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe Message do
    include_context 'Message setup'

    # Check that these attributes can be set as accessible types
    describe 'accessible attributes' do
      # its(:sender)    { should == sender }
      # its(:recipient) { should == recipient }
      its(:subject)   { should == subj }
      its(:body)      { should == body }
    end

    # describe 'inferred associations' do
    #   its(:outbound_mailbox)  { should be_a Mailbox }
    #   its(:inbound_mailbox)   { should be_a Mailbox }
    #   its(:mailbox) { should == message.inbound_mailbox } # aliased
    # end

    it { should be_valid }

    ##
    # Instance Methods
    # describe '#sender=' do

    #   context 'when provided with a username string', sender: 'sender' do

    #     it 'searches existing users for a matching record' do
    #       User.should_receive(:where).with(username: sender_attr).and_return([sender])
    #       message
    #     end

    #     context 'that has a match in the users table' do
    #       before(:each) do
    #         User.stub(:where).with(username: sender_attr).and_return([sender])
    #         message
    #       end

    #       its(:outbound_mailbox)  { should == outbound_mailbox }
    #       its(:sender)            { should == sender }
    #     end

    #     context 'that has no match in the users table' do
    #       before { User.stub(:where).and_return([nil]) }

    #       it 'raises no error' do
    #         expect { message }.not_to raise_error
    #       end

    #       its(:outbound_mailbox)  { should be_nil }
    #       its(:sender)            { should be_nil }
    #     end
    #   end

    #   context 'when provided with a User object' do

    #     it 'does not search existing users for a matching record' do
    #       User.should_not_receive(:where)
    #       message
    #     end

    #     its(:outbound_mailbox)  { should == outbound_mailbox }
    #     its(:sender)            { should == sender }
    #   end

    #   context 'when already saved' do
    #     before { message.stub(persisted?: true) }

    #     it 'raises error when attempting to set sender after being saved' do
    #       expect { message.sender = :new_sender }.to raise_error Message::SenderLockedError
    #     end
    #   end
    # end

    # describe '#recipient=' do

    #   context 'when provided with a username string', recipient: 'recipient' do

    #     it 'searches existing users for a matching record' do
    #       User.should_receive(:where).with(username: recipient_attr).and_return([recipient])
    #       message
    #     end

    #     context 'thas has a match in the users table' do
    #       before(:each) do
    #         User.stub(:where).with(username: recipient_attr).and_return([recipient])
    #         message
    #       end

    #       its(:inbound_mailbox) { should == inbound_mailbox }
    #       its(:recipient)       { should == recipient }
    #     end

    #     context 'that has no match in the users table' do
    #       before { User.stub(:where).and_return([nil]) }

    #       it 'raises no error' do
    #         expect { message }.not_to raise_error
    #       end

    #       its(:inbound_mailbox) { should be_nil }
    #       its(:recipient)       { should be_nil }
    #     end
    #   end

    #   context 'when provided with a User object' do

    #     it 'does not search existing users for a matching record' do
    #       User.should_not_receive(:where)
    #       message
    #     end

    #     its(:inbound_mailbox) { should == inbound_mailbox }
    #     its(:recipient)       { should == recipient }
    #   end

    #   context 'when already sent' do
    #     before { message.stub(sent?: true) }

    #     it 'raises error when attempting to set recipient after being sent' do
    #       expect { message.recipient = :new_recipient }.to raise_error Message::RecipientLockedError
    #     end
    #   end
    # end

    # describe '#sender' do
    #   it { should respond_to :sender }

    #   context 'when @sender is set' do
    #     before { message.instance_variable_set('@sender', :sender) }
    #     its(:sender) { should == :sender }
    #   end

    #   context 'when @sender is nil' do
    #     before { message.instance_variable_set('@sender', nil) } # unnecessary, but just in case.

    #     context 'but outbound_mailbox is set' do
    #       before { message.stub(outbound_mailbox: outbound_mailbox) }

    #       its(:sender) { should == :sender }

    #       it 'now has a non-nil @sender' do
    #         expect(message.instance_variable_get('@sender')).to be_nil
    #         message.sender # trigger method
    #         expect(message.instance_variable_get('@sender')).to eq :sender
    #       end
    #     end

    #     context 'and outbound_mailbox is also nil' do
    #       before { message.stub(outbound_mailbox: nil) }

    #       it 'raises no error' do
    #         expect { message.sender }.not_to raise_error
    #       end

    #       it 'does not call #mailboxable on a Mailbox object' do
    #         Mailbox.any_instance.should_not_receive(:mailboxable)
    #         message.sender
    #       end

    #       its(:sender) { should be_nil }

    #       it 'maintains @sender value of nil' do
    #         expect(message.instance_variable_get('@sender')).to be_nil
    #         message.sender
    #         expect(message.instance_variable_get('@sender')).to be_nil
    #       end
    #     end
    #   end
    # end

    # describe '#recipient' do
    #   it { should respond_to :recipient }

    #   context 'when @recipient is set' do
    #     before { message.instance_variable_set('@recipient', :recipient) }
    #     its(:recipient) { should == :recipient }
    #   end

    #   context 'when @recipient is nil' do
    #     before { message.instance_variable_set('@recipient', nil) }

    #     context 'but inbound_mailbox is set' do
    #       before { message.stub(inbound_mailbox: inbound_mailbox) }

    #       its(:recipient) { should == :recipient }

    #       it 'now has a non-nil @recipient' do
    #         expect(message.instance_variable_get('@recipient')).to be_nil
    #         message.recipient
    #         expect(message.instance_variable_get('@recipient')).to eq :recipient
    #       end
    #     end

    #     context 'and inbound_mailbox is also nil' do
    #       before { message.stub(inbound_mailbox: nil) }

    #       it 'raises no error' do
    #         expect { message.recipient }.not_to raise_error
    #       end

    #       it 'does not call #mailboxable on a Mailbox object' do
    #         Mailbox.any_instance.should_not_receive(:mailboxable)
    #         message.recipient
    #       end

    #       its(:recipient) { should be_nil }

    #       it 'maintains @recipient value of nil' do
    #         expect(message.instance_variable_get('@recipient')).to be_nil
    #         message.recipient
    #         expect(message.instance_variable_get('@recipient')).to be_nil
    #       end
    #     end
    #   end
    # end

    # describe '#outbound_mailbox' do

    #   it 'is a protected attribute' do
    #     Mailbox.stub(:where) { inbound_mailbox }
    #     expect(Message.new(outbound_mailbox: outbound_mailbox).outbound_mailbox).to be_nil
    #     expect(Message.new(outbound_mailbox_id: 1).outbound_mailbox).to be_nil
    #   end

    #   it 'is a protected method' do
    #     expect { Message.new.outbound_mailbox = outbound_mailbox }.to raise_error NoMethodError
    #   end

    #   its(:outbound_mailbox)  { should == outbound_mailbox }
    #   its(:sender)            { should == sender }
    # end

    # describe '#inbound_mailbox' do

    #   it 'is a protected attribute' do
    #     Mailbox.stub(:where) { inbound_mailbox }
    #     expect(Message.new(inbound_mailbox: inbound_mailbox).inbound_mailbox).to be_nil
    #     expect(Message.new(inbound_mailbox_id: 1).inbound_mailbox).to be_nil
    #     # ...and also...
    #     expect(Message.new(mailbox: inbound_mailbox).mailbox).to be_nil
    #     expect(Message.new(mailbox_id: 1).inbound_mailbox).to be_nil
    #   end

    #   it 'is a protected method' do
    #     expect { Message.new.inbound_mailbox = inbound_mailbox }.to raise_error NoMethodError
    #     expect { Message.new.mailbox           = inbound_mailbox }.to raise_error NoMethodError
    #   end

    #   its(:inbound_mailbox) { should == inbound_mailbox }
    #   its(:mailbox)         { should == inbound_mailbox } # aliased
    #   its(:recipient)       { should == recipient }
    # end

    ##
    # Persistence
    context 'during #save' do
      its(:save) { should be_true }

      it 'raises no error during #save!' do
        expect { message.save! }.not_to raise_error
      end
    end

    context 'after #save' do
      let(:saved_message) { message.save; message.reload }
      subject { saved_message }

      # before(:each) do
      #   message.stub({
      #     outbound_mailbox: outbound_mailbox,
      #      inbound_mailbox:  inbound_mailbox,
      #              mailbox:  inbound_mailbox
      #   })
      # end

      context 'when it was NOT marked for sent' do
        include_examples 'Saved Message expectations'

      #   context "from the sender's perspective" do
      #     before { subject.stub(:outbound_messages) { [] } }

      #     describe 'outbound_mailbox' do
      #       subject { message.outbound_mailbox }
      #       its(:outbound_messages) { should_not include saved_message }
      #     end

      #     describe 'sender' do
      #       subject { sender }
      #       its(:outbound_messages) { should_not include saved_message }
      #     end
      #   end

      #   # Test these kinds of filtered associations from something like the
      #   # User class spec instead. Stubbing them out here.
      #   context "from the recipient's perspective" do
      #     before { subject.stub(inbound_messages: [], messages: []) }

      #     describe 'inbound_mailbox' do
      #       subject { message.inbound_mailbox }
      #       it { should be message.mailbox } # aliased
      #       its(:inbound_messages)  { should_not include saved_message }
      #       its(:messages)          { should_not include saved_message } # aliased
      #     end

      #     describe 'recipient' do
      #       subject { recipient }
      #       its(:inbound_messages)  { should_not include saved_message }
      #       its(:messages)          { should_not include saved_message } # aliased
      #     end
      #   end
      end

      context 'when it was marked for sent' do
        before { message.mark_as_sent }

        include_examples 'Saved Message expectations'
        before { saved_message }
      #   context "from the sender's perspective" do
      #     before { subject.stub(:outbound_messages) { [saved_message] } }

      #     describe 'outbound_mailbox' do
      #       subject { message.outbound_mailbox }
      #       its(:outbound_messages) { should include saved_message }
      #     end

      #     describe 'sender' do
      #       subject { sender }
      #       its(:outbound_messages) { should include saved_message }
      #     end
      #   end

      #   context "from the recipient's perspective" do
      #     before { subject.stub(inbound_messages: [saved_message], messages: [saved_message]) }

      #     describe 'inbound_mailbox' do
      #       subject { message.inbound_mailbox }
      #       it { should == message.mailbox } # aliased
      #       its(:inbound_messages)  { should include saved_message }
      #       its(:messages)          { should include saved_message } # aliased
      #     end

      #     describe 'recipient' do
      #       subject { recipient }
      #       its(:inbound_messages)  { should include saved_message }
      #       its(:messages)          { should include saved_message } # aliased
      #     end
        # end
      end
    end #/after save

  end
end
