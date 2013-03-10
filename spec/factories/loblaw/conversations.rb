# encoding: utf-8

module Loblaw
   FactoryGirl.define do
    factory :conversation do
      sequence(:id) { |i| i }
      # association :starter, factory: :user
      title 'title'
      permalink 'permalink'
      status 0
      token { 'sometoken' }
      wrapped_up_at {}
      messages_count 0
      views_count 200
      participants_count 0

      factory :conversation_with_5_messages do
        after(:create) { |c| create_list(:message, 5, conversation: c) }
      end
    end
  end
end
