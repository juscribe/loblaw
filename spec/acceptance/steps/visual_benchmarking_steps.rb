# encoding: utf-8
require 'active_support/concern'

module VisualBenchMarkToggle
  extend ActiveSupport::Concern

  included do
    option_on = !!RSpec.configuration.visual_benchmark
    metadata[:visual_benchmark_on]  =  option_on
    metadata[:visual_benchmark_off] = !option_on

    if option_on
      metadata[:js] = true
      Capybara.javascript_driver = :poltergeist
    end
  end
end

RSpec.configure do |c|
  c.add_setting :visual_benchmark, default: false
  c.visual_benchmark = ENV['bm:visual'] == '1'
  # c.visual_benchmark = true
  c.include(VisualBenchMarkToggle, visual_benchmark: true)
end

steps_for :visual_benchmark_on do
  # before(:all) do

  # end

  step 'I should still be presented with a welcoming interface' do
    step 'I should see several prominent graphics on the page'
    step 'I should not see empty lists collapsed to useless heights'
    step 'there should be plenty of interaction-beckoning UI elements'
  end

  step 'I should not see blank regions scattered about' do
    pending %{This requires a statistical determination of what constitutes
      having too much blank regions, and once that determination is made,
      we can implement either an OCR-type of image analysis based on a
      screenshot with Poltergeist could capture, or have it randomly
      around the viewport and then determine if legitimate content was
      underneath each x-y coordinate in more or less times than would be
      desired.}
  end

  step 'I should see several prominent graphics on the page' do
    prominents = all(:xpath, '//img[@src]', visible: true).select do |img|
      selector = img[:id].present? ? "img##{img[:id]}" :
                                    %{img[src="#{img[:src]}"]}
      evaluate_script(%{
        var $el = jQuery('#{selector}');
        return $el.height() > 100 && $el.width() > 200;
      })
    end

    expect(prominents).to have_at_least(7).items
  end

  step 'I should not see empty lists collapsed to useless heights' do
    find('#canvas').all(:css, 'ul,ol,section,article').each do |node|
      expect(node).to be_visible

    end
  end

  step 'there should be plenty of interaction-beckoning UI elements' do
    find('#canvas').all(:css, 'button,.button,input,canvas,embed', minimum: 7).each do |node|
      expect(node).to be_visible

    end
  end

  step 'I should only be mindful of a desire to contribute to a deserted conversation' do
    pending %{This is more in the business of analyzing conversion rates, but as far as
      a programmatic assessment is concerned, you can put the driver on a timer
      representing loss of interest, where its coming across another "attention-grabbing"
      item resets or extends the clock. If expires before a predetermined per-page
      stanadard, then the test fails.
      This suggests a degree of randomness which opposes the necessity of a
      deterministic set of results from automated tests, so we'll need to
      establish a stringent criteria whereby only a decidedly favorable result
      warrants a pass.}
  end
end

steps_for :visual_benchmark_off do
  step 'I should still be presented with a welcoming interface' do; end
  step 'I should not see blank regions scattered about' do; end
  step 'I should see several prominent graphics on the page' do
    expect(page).to have_xpath('//img[@src]', visible: true, minimum: 7)
  end
  step 'I should not see empty lists collapsed to useless heights' do
    find('#canvas').all(:css, 'ul,ol,section,article').each do |node|
      expect(node).to be_visible

    end

  end
  step 'there should be plenty of interaction-beckoning UI elements' do
    find('#canvas').all(:css, 'button,.button,input,canvas,embed', minimum: 7).each do |node|
      expect(node).to be_visible

    end
  end
  step 'I should only be mindful of a desire to contribute to a deserted conversation' do; end
end

placeholder :variable_count do

  match /at least (\d+)/ do |num|
    { minimum: num.to_i }
  end
  # FIXME: The setting of @find_opts here questionable
  match /at most (\d+)/ do |num|
    { maximum: num.to_i }
  end

  match /\d+/ do |num|
    { count: num.to_i }
  end

  match /no/ do
    { count: 0 }
  end

  match /many/ do
    { minimum: 1 }
  end
end

placeholder :model_selector do
  match /\S+/ do |model_name|
    model_xpath(model_name)
  end
end

placeholder :num do
  match(/\d+/, &:to_i)
end
