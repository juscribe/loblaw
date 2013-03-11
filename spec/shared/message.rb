# encoding: utf-8

module Loblaw
  shared_context 'Message setup' do
    # let(:mailbox1)  { mock_model('Mailbox', mailboxable: :sender) }
    # let(:mailbox2)  { mock_model('Mailbox', mailboxable: :recipient) }
    # let(:mailbox)   { mailbox1 }

    # let(:user1) { mock_model('User', mailbox: mailbox1) }
    # let(:user2) { mock_model('User', mailbox: mailbox2) }
    # let(:user)  { user1 }

    # let(:sender)    { user1 }
    # let(:recipient) { user2 }

    # let(:outbound_mailbox)  {    sender.mailbox }
    # let(:inbound_mailbox)   { recipient.mailbox }

    # # Non-AR-object inputs for constructor
    # let(:sender_attr)     { example.metadata[:sender]    || sender }
    # let(:recipient_attr)  { example.metadata[:recipient] || recipient }

    let(:subj) { example.metadata[:subj] || 'This is a subject' }
    let(:body) { example.metadata[:body] || 'Junk body text.' }

    let(:message) do
      Message.new({
        #    sender: sender_attr,
        # recipient: recipient_attr,
          subject: subj,
             body: body
      })
    end

    subject { message } # separate from :message on purpose. for #reload later.
  end

  shared_examples 'Saved Message expectations' do
    it { should be message }    # same object as before
    it { should be_persisted }  # saved properly in database

    describe 'persisted attributes' do
      its(:id) { should_not be_nil }
      its(:subject) { should == subj }
      its(:body)    { should == body }
      # its(:sender)    { should == sender }
      # its(:recipient) { should == recipient }
      # its(:outbound_mailbox)  { should ==    sender.mailbox }
      # its(:inbound_mailbox)   { should == recipient.mailbox }
    end
  end
end
