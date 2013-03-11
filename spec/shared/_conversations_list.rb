# encoding: utf-8

shared_context 'Renders partial: conversations/list' do
  let(:num) { example.metadata[:num] || 5 }
  let(:conversations) { Array.new(num) { |i| build(:conversation, id: i.succ) } }
  before { assign(:conversations, conversations) }

  describe 'Partial: conversation/list' do
    before { render }

    let(:tree) { ['', {
      list: ['//*[@class="conversations"]', {
          item: ['/li', {
                        link: '/a[@href]',
              messages_count: '[@data-messages-count]',
                  updated_at: '[@data-updated-at]'
            }]
          }]
        }] }

    it 'renders a listing wrapper' do
      expect_xpath :list
    end

    it 'renders a listing element' do
      expect_xpath :list, :item
    end

    context 'when there is no activity', num: 0 do
      it 'does not render a listing element' do
        expect(rendered).not_to have_xpath xpath_for(:list, :item)
      end
    end

    describe 'Each listing' do
      it 'renders a link to the specific item that is listed' do
        expect_xpath :list, :item, :link
      end

      it 'has a data-messages-count attribute' do
        expect_xpath :list, :item, :messages_count, count: num
      end

      it 'has a data-updated-at attribute' do
        expect_xpath :list, :item, :updated_at, count: num
      end
    end
  end
end
