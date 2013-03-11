# encoding: utf-8

shared_context 'Renders partial: messages/message' do
  it 'wraps each message in an ARTICLE tag' do
    expect(conversation).to have(num).messages
    expect_xpath '//article[@class="message"]'
  end
end
