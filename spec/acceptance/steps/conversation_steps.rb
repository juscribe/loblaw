# encoding: utf-8

steps_for :conversation do

  step 'a just-created conversation with only its inaugural message' do
    @conversation = create(:conversation, title: %{Talkin Bout the Weather})
    @message = create(:message, conversation: @conversation)
    expect(@conversation).to be_persisted
    expect(@conversation.reload.title).to eq %{Talkin Bout the Weather}
    expect(@conversation).to have(1).message
    @id_for_page = @conversation.id
  end

  step 'I should be taken to the conversation page' do
    expect(page.current_path).to match %r{/conversations/\d+$}
  end

  step 'I should see the conversation grouping info headlining the page' do
    step 'I should see the conversation masthead'
    step 'the browser title should resemble the conversation title'
  end

  step 'the browser title should resemble the conversation title' do
    pending 'investigation of how to grep for title'
    # expect(page).to have_xpath('//title', text: %r{Talkin Bout the Weather})
  end

  step 'I should see the conversation masthead' do
    step 'I should see the "Talkin Bout the Weather" heading'
    step 'I should see a detailed info of the original message'
  end

  step 'I should see a detailed info of the original message' do
    # This toggling of header should happen via CSS or JavaScript dynamically
    expect(page).to have_xpath('//article/header[@class="expanded"]')
  end

  step 'I should see an inviting form contributing to the conversation' do
    expect(page).to have_xpath('//form[@class="form-composition"]')
  end

  step 'I should see just one message on the page' do
    expect(page.current_path).to match(%r{/conversations/#{@id_for_page}})
    expect(page).to have_css('article > header + section > article.message', count: 1)
  end

  step 'I should see the first message in a region clearly meant for a list' do
    expect(page).to have_css('article > header + section > article.message')
  end
end
