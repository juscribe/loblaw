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
      ignore do
        messages_count 0
      end
      views_count 200
      participants_count 0

      before(:create) do |c, ev|
        build_list(:message, ev.messages_count, conversation: c).each do |m|
          c.messages << m
        end
      end
    end
  end
end
