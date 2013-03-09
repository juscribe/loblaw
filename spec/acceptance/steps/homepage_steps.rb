# encoding: utf-8

step 'I should see a friendly "Welcome" message' do
  expect(page).to have_content 'Welcome to Loblaw'
end

