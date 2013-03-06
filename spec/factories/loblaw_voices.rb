# encoding: utf-8
FactoryGirl.define do

  factory :loblaw_voice, aliases: [:voice], class: 'Loblaw::Voice' do
    association :owner, factory: :user
    # user
    graph
  end
end
