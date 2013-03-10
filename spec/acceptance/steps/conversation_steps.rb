# encoding: utf-8

steps_for :conversation do

  step 'a just-created conversation with only its inaugural message' do
    @message = create(:message)
  end

  step 'I should be taken to the conversation page' do
    expect(page.current_path).to match %r{/conversations/\d+$}
  end
end
