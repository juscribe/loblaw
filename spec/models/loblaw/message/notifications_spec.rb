# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe Message, 'Notifications' do
    include_context 'Message setup'

    describe 'during #save' do

      context 'when it is not yet being sent' do
        it 'does not yet send notifications to recipient' do
          message.should_not_receive(:deliver_message_notifications)
          message.save
        end
      end

      context 'when it has already long been sent' do
        before { message.stub(sent_changed?: false, sent?: true) }

        it 'does not send another sent notification to recipient' do
          message.should_not_receive(:deliver_message_notifications)
          message.save
        end
      end

      context 'when it is NOW marked to be sent' do
        before { message.mark_as_sent }

        it 'delivers message notifications' do
          message.should_receive(:deliver_message_notifications)
          message.save
        end
      end
    end
  end
end
