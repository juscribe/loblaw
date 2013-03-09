# encoding: utf-8

module Loblaw

  # Usage: it_renders_partial 'conversations/list'
  shared_context 'conversations/list' do
    let(:num) { 5 }
    let(:conversations) { Array.new(num) { |i| build(:conversation, id: i.succ) } }
    before { assign(:conversations, conversations) }

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it 'renders a listing wrapper' do
      render
      expect(rendered).to have_xpath '//*[@class="conversations"]'
    end

    context 'when there is no activity' do
      let(:num) { 0 }

      it 'does not render a listing element' do
        render
        expect(rendered).not_to have_xpath '//*[@class="conversations"]/li'
      end
    end

    it 'renders a listing element' do
      render
      expect(rendered).to have_xpath '//*[@class="conversations"]/li'
    end

    it 'renders a link to the specific item that is listed' do
      render
      expect(rendered).to have_xpath '//*[@class="conversations"]/li/a[@href]'
    end

    describe 'Each listing' do

      it 'has a data-messages-count attribute' do
        render
        expect(rendered).to have_xpath(%{//*[@class="conversations"]/li[@data-messages-count]}, count: 5)
      end

      it 'has a data-updated-at attribute' do
        render
        expect(rendered).to have_xpath(%{//*[@class="conversations"]/li[@data-updated-at]}, count: 5)
      end
    end

    context 'with less than the :per_page limit of records' do

      it 'renders without error' do
        expect { render }.not_to raise_error
      end
    end

    context 'with 11 total items' do
      # let(:conversations) { Array.new(11) { |i| build(:conversation, id: i.succ) } }
      let(:num) { 11 }

      it 'renders without error' do
        expect { render }.not_to raise_error
      end
    end
  end

  module AliasContext
    def it_renders_partial(name)
      include_context(name)
    end
  end

  RSpec.configure do |c|
    c.extend(AliasContext, type: :view)
    # Kaminari
    c.before(:each, type: :view) { view.stub(:paginate) }
  end
end
