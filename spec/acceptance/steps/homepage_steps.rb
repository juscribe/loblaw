# encoding: utf-8

step 'there had been :num conversation(s)' do |num|
  @conversations = create_list(:conversation, num.to_i)
  Loblaw::Conversation.stub(:latest) { @conversations.take(Loblaw::HomeController.per_page) }
end

step 'I should see no conversation listed' do
  expect(page).not_to have_content 'minutes ago'
end

step 'I should see a conversation listed' do
  expect(page).to have_content "minutes ago"
end

step 'I should see :num recent conversation(s)' do |num|
  expect(page).to have_xpath './/*[@class="conversations"]/li', count: num
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

step 'I should see the :heading heading' do |heading|
  expect(page).to have_xpath('.//h1', text: heading)
end

step 'I should see several email addresses' do
  expect(page).to have_xpath('.//*[@class="contacts"]//a', minimum: 2)
end

step 'I should see several fun photos' do
  expect(page).to have_xpath('.//*[@class="photos"]//li', minimum: 3)
end

step 'I should see a text wall exceeding no length warranting a "verbose" label' do
  expect(page).to have_xpath('.//p[@class="story-about"]', minimum: 1)
  page.all(:xpath, './/p[@class="story-about"]').each do |p|
  # paragraphs.each do |p|
    expect(p.text.length).to be < 500
  end
end
