# encoding: utf-8

module Loblaw

   FactoryGirl.define do

     factory :loblaw_conversation, aliases: [:conversation], class: '::Loblaw::Conversation' do
       # association :starter, factory: :loblaw_user
       title 'title'
       permalink 'permalink'
       status 0
       token { 'sometoken' }
       wrapped_up_at {}
       messages_count 0
       views_count 200
       participants_count 0
     end
   end
end
