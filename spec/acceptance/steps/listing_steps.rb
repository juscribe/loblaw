# encoding: utf-8

step 'I should see :variable_count :model_selector' do |variable_count, model_selector|
  expect(page).to have_xpath(model_selector, variable_count)
end

step 'I should see :variable_count :model_selector with answers' do |variable_count, model_selector|
  expect(page).to have_xpath(%{#{model_selector}/*/*}, variable_count)
end

step 'I should see the results ordered by popularity' do
  orig_pops = all(:xpath, '//*[@class="conversations"]/li').map { |li| li[:'data-popularity'] }
  expect(orig_pops).to eq orig_pops.sort_by { |p| -p.to_i }
end

