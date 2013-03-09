# encoding: utf-8
require 'faker'

module Loblaw
  FactoryGirl.define do
    factory :user do
      sequence(:id) { |i| i }
      email { Faker::Internet.email }
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
    end
  end
end
