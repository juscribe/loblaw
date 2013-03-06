# encoding: utf-8

step 'I am a new visitor' do
  @current_user = create(:loblaw_user)
end

step 'there had been :num conversation(s)' do |num|
  @conversations = create_list(:loblaw_conversation, num.to_i)
end

step 'I visit the main page' do
  visit '/loblaw'
end

step 'I should see no conversation listed' do
  expect(page).not_to have_content 'minutes ago'
end

step 'I should see a friendly "Welcome" message' do
  expect(page).to have_content 'Welcome to Loblaw'
end

step 'I should see a conversation listed' do
  expect(page).to have_content "minutes ago"
end

step 'I should see :num recent conversation(s)' do |num|
  expect(page).to have_xpath './/*[@class="conversations"]/li', count: num
end

step 'each conversation has had :num message(s)' do |num|
  Loblaw::Conversation.all.each do |conversation|
    conversation.messages = create_list(:loblaw_message, num.to_i)
  end
end

step 'I click on the first conversation link' do
  find('.conversations > li:first > a').click()
end

step 'I should be taken to the conversation page' do
  expect(page.current_path).to match %r{/conversations/1$}
end
