# encoding: utf-8

step 'I visit the :name page' do |name|
  visit case name
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
