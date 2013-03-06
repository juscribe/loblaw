# encoding: utf-8

module Loblaw

  # Usage: it_renders_partial 'conversations/list'
  shared_examples 'conversations/list' do

    it 'renders a listing wrapper' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]'
    end

    context 'when there is no activity' do
      let(:conversations) { Conversation.null_relation }

      it 'does not render a listing element' do
        render
        expect(rendered).not_to have_xpath './/*[@class="conversations"]/li'
      end
    end

    it 'renders a listing element' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]/li'
    end

    it 'renders a link to the specific item that is listed' do
      render
      expect(rendered).to have_xpath './/*[@class="conversations"]/li/a[@href]'
    end
  end
end
