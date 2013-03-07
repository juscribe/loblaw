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

step 'I should see :variable_count :model_name' do |variable_count, model_name|
  @model_xpath = model_name =~ /section/ ? %{.//section[@class]} :
                                           %{.//*[@class="#{model_name}"]/li}
  expect(page).to have_xpath(@model_xpath, @find_opts)
end

step 'with answers' do
  expect(page).to have_xpath(%{#{@model_xpath}/*/*}, @find_opts)
end

step 'I should see :variable_count :model_name with answers' do |variable_count, model_name|
  send 'I should see :variable_count :model_name', variable_count, model_name
  send 'with answers'
end

placeholder :variable_count do
  match /at least (\d+)/ do |num|
    @find_opts = { minimum: num.to_i }
  end

  match /at most (\d+)/ do |num|
    @find_opts = { maximum: num.to_i }
  end

  match /\d+/ do |num|
    @find_opts = { count: num }
  end
end

step 'I should see a bunch of legal jargon' do
  expect(page).to have_xpath(%{.//*[@class="terms"]/p}, minimum: 10)
end
