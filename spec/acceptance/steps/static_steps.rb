# encoding: utf-8

step 'I should see several email addresses' do
  expect(page).to have_xpath('.//*[@class="contacts"]//a', minimum: 2)
end

step 'I should see several fun photos' do
  expect(page).to have_xpath('.//*[@class="photos"]//li', minimum: 3)
end

step 'I should see a text wall exceeding no length warranting a "verbose" label' do
  expect(page).to have_xpath('.//p[@class="story-about"]', minimum: 1)
  page.all(:xpath, './/p[@class="story-about"]').each do |p|
    expect(p.text.length).to be < 500
  end
end

step 'I should see a bunch of legal jargon' do
  expect(page).to have_xpath(%{.//*[@class="terms"]/p}, minimum: 10)
end
