# encoding: utf-8

module Loblaw
  FactoryGirl.define do

    factory :voice do
      association :owner, factory: :user
      # user
      graph
    end
  end
end
