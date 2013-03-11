# encoding: utf-8

module ViewHelper
  module ClassMethods

    def it_renders_error_free
      it 'renders without error' do
        expect { render }.not_to raise_error
      end
    end

    def its_got_some_bull(still = false)
      if !still
        it 'aint got no bull no mo' do
          expect(rendered).not_to have_content 'some bull'
        end
      else
        it 'got some bull' do
          expect(rendered).to have_content 'some bull'
        end
      end
    end

    def it_displays_header(text)
      it 'displays a header which says "#{text}"' do
        expect_xpath './/h1', text: text
      end
    end

    def it_renders_partial(name)
      include_context("Renders partial: #{name}")
    end
  end
end

RSpec.lazy_configure do |c|
  c.extend(ViewHelper::ClassMethods, type: :view)

  c.before(:each, type: :view) do
    view.stub(:paginate) # Kaminari
    view.stub(:app_name) { 'Loblaw' }
  end
end
