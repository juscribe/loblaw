# encoding: utf-8

steps_for :conversations do

  step 'there had been :num conversation(s)' do |num|
    @conversations = create_list(:conversation, num)
  end
  step 'each conversation has had :num message(s)' do |num|
    Loblaw::Conversation.all.each { |c| c.stub(:messages) { @messages = create_list(:message, num) } }
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

  step 'there had been a healthy level of activity site-wide' do
    step 'there had been 50 conversations'
    step 'each conversation has had 5 messages'
  end

  step 'I click on the first conversation link' do
    first('.conversations > li > a').click
  end

  step 'I click the link for sorting the list by :sort' do |sort|
    @sort_text =  case sort
                  when /activity/   then 'Activity'
                  when /recency/    then 'Latest'
                  else
                    raise "Invalid kind of sorter: #{sort.inspect}"
                  end
    expect(@sort_text).to be_present
    find('.sort-options a', text: @sort_text).click
  end

  # PROBLEMATIC. occasionally fails.
  step 'I should see the conversations sorted by :sort' do |sort|
    @sort_attribute = case sort
                      when /activity/   then :'data-messages-count'
                      when /recency/    then :'data-updated-at'
                      else
                        raise "Invalid kind of sorter: #{sort.inspect}"
                      end
    expect(@sort_attribute).to be_present

    all_conversations   = find(:css, '.conversations').all(:xpath, %{./li[@#{@sort_attribute}]})
    first_conversation  = all_conversations.first

    first_val  = first_conversation[@sort_attribute]
    max_val = all_conversations.max_by { |c| c[@sort_attribute] }[@sort_attribute]

    expect(first_val).to eq max_val
  end
end
