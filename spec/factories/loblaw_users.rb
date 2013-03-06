# encoding: utf-8
require 'faker'

FactoryGirl.define do

  factory :loblaw_user, aliases: [:user], class: 'Loblaw::User' do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
