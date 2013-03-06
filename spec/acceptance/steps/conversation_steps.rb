# encoding: utf-8

step 'I should see 3 messages' do
  # pending
end

step 'I should see no results' do
  expect(page).not_to have_xpath('.//*[@class="conversations"]//img', minimum: 1)
end
