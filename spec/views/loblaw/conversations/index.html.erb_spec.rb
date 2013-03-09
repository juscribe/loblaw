# encoding: utf-8
require 'spec_helper'

module Loblaw
  describe 'loblaw/conversations/index' do
    before(:all) { @conversations = create_list(:conversation, 5) }
    after(:all) { Conversation.delete_all }
    before { assign(:conversations, conversations) }

    let(:conversations) { @conversations }

    it 'renders without error' do
      expect { render }.not_to raise_error
    end

    it_renders_partial 'conversations/list'

    context 'with less than the :per_page limit of records' do

      it 'renders without error' do
        expect { render }.not_to raise_error
      end

      it 'renders no pagination controls' do
        render
        xpath = %{.//*[@class="pagination"]}
        expect(rendered).not_to have_xpath(xpath)
        expect(rendered).not_to have_xpath(%{#{xpath}//a[@href]})
      end
    end

    context 'with 11 total items' do
      before(:all) { @conversations += create_list(:conversation, 6) }

      it 'renders without error' do
        expect { render }.not_to raise_error
      end

      it 'renders the pagination controls' do
        render
        xpath = %{.//*[@class="pagination"]}
        expect(rendered).to have_xpath(xpath)
        expect(rendered).to have_xpath(%{#{xpath}//a[@href]})
      end

      it 'should put me on page 1' do
        render
        xpath = %{.//*[@class="pagination"]/*[@class="current"]/a}
        expect(rendered).to have_xpath(xpath, text: '1')
      end

      it 'lists 3 total pages available, for 8 per_page' do
        render
        xpath = %{.//*[@class="pagination"]//a}
        expect(rendered).to have_xpath(xpath, count: 3)
      end
    end
  end
end
