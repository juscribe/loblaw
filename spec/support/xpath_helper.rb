# encoding: utf-8

module XPathHelper
  # = XPathHelper
  #
  # Helps centralize the definition of a tree structure against which to make
  # expectations in RSpec views.
  # The method expects +tree+ to be defined, either in the same context as where
  # you'd call it, or easier still, within a <tt>let(:tree)</tt> statement.
  #
  # === Example
  #
  #   tree = ['//', {
  #     wrapper: ['*[@class="conversations"]', {
  #       listing: ['/li', {
  #                   link: '/a[@href]',
  #         messages_count: '[@data-messages-count]',
  #             updated_at: '[@data-updated-at]'
  #       }]
  #     }]
  #   }]
  #
  #   xpath_for_tree(tree, :wrapper, :listing, link)
  #   # => "//*[@class=\"conversations\"]/li/a[@href]"
  #
  # === Example in RSpec
  #
  #   let(:tree) { ..[same tree as before].. }
  #
  #   it 'has 4 of these things' do
  #     render
  #     expect(rendered).to have_xpath xpath_for(:wrapper, :listing), count: 4
  #     # same as:
  #     expect_xpath(:wrapper, :listing, count: 4)
  #   end
  def xpath_for(*keys)
    xpath_for_tree(tree, *keys)
  end

  def xpath_for_tree(tree, *keys)
    keys.inject(tree) do |(xpath, branches), key|
      xp, _tree = branches.fetch(key, []) # options later to error maybe
      [xpath + xp, _tree]
    end[0]
  end

  def expect_xpath(*xparts)
    opts = xparts.extract_options!
    xparts = xpath_for(*xparts) if xparts.many? || xparts.first.is_a?(Symbol)
    expect(example.metadata[:type] == :view ? rendered : page).to have_xpath(*xparts, opts)
  end

  def model_xpath(model_name)
    case model_name
    when /^section/     then  %{//section[@class]}
    when /^result/      then  %{//*[@class="conversations"]/li}
    else                      %{//*[@class="#{model_name}"]/li}
    end
  end
end

RSpec.lazy_configure { |c| c.include ::XPathHelper, type: /view|turnip/ }
Turnip::Placeholder.send(:include, ::XPathHelper)
