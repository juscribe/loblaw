# encoding: utf-8

step 'I should see :variable_count :model_name' do |variable_count, model_name|
  @model_xpath =  case model_name
                  when /^section/     then  %{//section[@class]}
                  when /^result/      then  %{//*[@class="conversations"]/li}
                  else                      %{//*[@class="#{model_name}"]/li}
                  end
  expect(page).send(variable_count == 0 ? :not_to : :to,
                    have_xpath(@model_xpath, @find_opts))
end

placeholder :variable_count do
  match /at least (\d+)/ do |num|
    @find_opts = { minimum: num.to_i }; num.to_i
  end
  # FIXME: The setting of @find_opts here questionable
  match /at most (\d+)/ do |num|
    @find_opts = { maximum: num.to_i }; num.to_i
  end

  match /\d+/ do |num|
    @find_opts = { count: num.to_i }; num.to_i
  end

  match /no/ do |num|
    @find_opts = { minimum: 1 }; 0
  end

  match /many/ do |num|
    @find_opts = { minimum: 1 }; 2
  end
end

step 'I should see :variable_count :model_name with answers' do |variable_count, model_name|
  send 'I should see :variable_count :model_name', variable_count, model_name
  send 'with answers'
end

step 'with answers' do
  expect(page).to have_xpath(%{#{@model_xpath}/*/*}, @find_opts)
end

step 'I should see the results ordered by popularity' do
  orig_pops = all(:xpath, '//*[@class="conversations"]/li').map { |li| li[:'data-popularity'] }
  expect(orig_pops).to eq orig_pops.sort_by { |p| -p.to_i }
end

placeholder :num do
  match(/\d+/, &:to_i)
end
