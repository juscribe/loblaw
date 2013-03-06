# encoding: utf-8

# class CreateLoblawConversations < ActiveRecord::Migration
#   def change
#     create_table :loblaw_conversations do |t|
#       t.belongs_to :starter
#       t.string :title
#       t.string :permalink

#       t.integer :status
#       t.string :token
#       t.datetime :wrapped_up_at

#       t.integer :messages_count, default: 0
#       t.integer :views_count, default: 0
#       t.integer :participants_count, default: 0
#       t.timestamps
#     end
#   end
# end

FactoryGirl.define do

  factory :loblaw_conversation, aliases: [:conversation], class: 'Loblaw::Conversation' do
    association :starter, factory: :loblaw_user
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
