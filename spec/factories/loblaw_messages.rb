# encoding: utf-8

FactoryGirl.define do

  factory :loblaw_message, aliases: [:message], class: 'Loblaw::Message' do
    conversation
  end
end
