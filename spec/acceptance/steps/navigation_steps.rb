# encoding: utf-8

RSpec.configure do |c|

  c.include(Module.new do
    def uri_from_page_name(name)
      case name
      when 'Main'     then '/loblaw'
      when 'About'    then '/loblaw/about'
      when 'Contact'  then '/loblaw/contact'
      when 'FAQ'      then '/loblaw/faq'
      when 'Help'     then '/loblaw/help'
      when 'Terms'    then '/loblaw/terms'
      when 'Conversations'
        then '/loblaw/conversations'
      else
        '/loblaw'
      end
    end
  end)
end

step 'I visit the :name page' do |name|
  visit uri_from_page_name(name)
end

step 'I visit the :name page :num' do |name, num|
  visit [uri_from_page_name(name), *num].join('?page=')
end

step 'I should see the :heading heading' do |heading|
  expect(page).to have_xpath('.//h1', text: heading)
end
