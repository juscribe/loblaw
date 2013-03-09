# encoding: utf-8

step 'there had been :num conversation(s)' do |num|
  @conversations = create_list(:conversation, num.to_i)
  Loblaw::Conversation.stub(:latest) { @conversations.take(Loblaw::HomeController.per_page) }
end

step 'I should see no conversation listed' do
  expect(page).not_to have_content 'minutes ago'
end

step 'I should see a conversation listed' do
  expect(page).to have_content 'minutes ago'
end

step 'I should see :num recent conversation(s)' do |num|
  expect(page).to have_xpath './/*[@class="conversations"]/li', count: num.to_i
end

step 'each conversation has had :num message(s)' do |num|
  Loblaw::Conversation.all.each do |conversation|
    conversation.messages = create_list(:message, num.to_i)
  end
end

step 'I click on the first conversation link' do
  find('.conversations > li:first > a').click()
end

step 'I should be taken to the conversation page' do
  expect(page.current_path).to match %r{/conversations/\d+$}
end

step 'the page limit has been set to :num' do |num|
  Loblaw::ConversationsController.stub(:per_page) { num.to_i }
end
