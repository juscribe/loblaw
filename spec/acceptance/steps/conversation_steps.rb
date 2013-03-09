  # encoding: utf-8

steps_for :conversations do

  step 'there had been :num conversation(s)' do |num|
    ::Loblaw::Conversation.count.should eq 0
    @conversations = ::Loblaw::Conversation.where(id: FactoryGirl.create_list(:loblaw_conversation, num).map(&:id))
    ::Loblaw::ApplicationController.any_instance.stub(:get_conversations) { @conversations.page(1) }
  end

  step 'I should see no conversation listed' do
    expect(page).not_to have_content 'minutes ago'
  end

  step 'I should see a conversation listed' do
    expect(page).to have_content 'minutes ago'
  end

  step 'I should see :num recent conversation(s)' do |num|
    expect(page).to have_xpath '//*[@class="conversations"]/li', count: num.to_i
  end

  step 'each conversation has had :num message(s)' do |num|
    Conversation.all.each do |conversation|
      conversation.messages = FactoryGirl.create_list(:loblaw_message, num)
    end
  end

  step 'I click on the first conversation link' do
    first('.conversations > li > a').click
  end

  step 'I should be taken to the conversation page' do
    expect(page.current_path).to match %r{/conversations/\d+$}
  end

  step 'the page limit has been set to :num' do |num|
    # Loblaw::ConversationsController.stub(:per_page) { num.to_i }
  end

  def sort_text_for(sort)
    case sort
    when /activity/   then 'Activity'
    when /recency/    then 'Latest'
    else
      raise "Invalid kind of sorter: #{sort.inspect}"
    end
  end

  def sort_attribute_for(sort)
    case sort
    when /activity/   then 'data-messages-count'
    when /recency/    then 'data-updated-at'
    else
      raise "Invalid kind of sorter: #{sort.inspect}"
    end
  end

  step 'I click the link for sorting the list by :sort' do |sort|
    @sort_text = sort_text_for(sort)
    expect(@sort_text).to be_present
    find('.sort-options a', text: @sort_text).click
  end

  step 'I should see the conversations sorted by :sort' do |sort|
    # send 'Set sort attribute expectation for :sort', sort
    @sort_attribute = sort_attribute_for(sort)
    expect(@sort_attribute).to be_present
    all_conversations   = find('.conversations').all(:xpath, %{./li[@#{@sort_attribute}]})
    first_conversation  = all_conversations.first
    last_conversation   = all_conversations.last
    first_comments_count  = first_conversation[@sort_attribute.to_sym]#.to_i
    last_comments_count   =  last_conversation[@sort_attribute.to_sym]#.to_i

    expect(first_comments_count).to be <= last_comments_count
  end
end
