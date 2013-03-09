# encoding: utf-8

Dir.glob('spec/acceptance/steps/**/*steps.rb') { |f| load f, true }

placeholder :num do
  match /\d+/ do |num|
    num.to_i
  end
end
