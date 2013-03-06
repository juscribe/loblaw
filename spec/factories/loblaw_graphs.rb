# encoding: utf-8
FactoryGirl.define do

  factory :loblaw_graph, aliases: [:graph], class: 'Loblaw::Graph' do
    name { 'boink' }
  end
end
