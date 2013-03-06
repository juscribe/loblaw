# encoding: utf-8

step 'I visit the :name page' do |name|
  case name
  when 'main'     then visit '/loblaw'
  when 'about'    then visit '/loblaw/about'
  when 'contact'  then visit '/loblaw/contact'
  else
  end
end
