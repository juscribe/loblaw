# encoding: utf-8

# == Capybara settings:
Capybara.register_driver :poltergeist do |app|
  # The following binary is for my local build MacOSX, which matches the
  # phantomjs version of what is used by Circle.
  custom_bin = File.expand_path('../../bin/phantomjs', __FILE__)

  Capybara::Poltergeist::Driver.new(app, {
    js_errors: !ENV['CI'],
    # logger: ..., # Something that responds to #puts
    # phantomjs_logger: nil, # for master, not 1.0.2
    # debug: true,
    # inspector: true,
    # extensions: [], # Preloaded scripts to stub APIs, for ex.
    phantomjs_options: [
      '--load-images=yes',
      # '--local-to-remote-url-access=no', # Turning this off coincided with greens
      '--ignore-ssl-errors=yes',
      '--web-security=no'
    ]
  }.merge(File.exist?(custom_bin) ? { phantomjs: js } : {}))
end

Capybara.javascript_driver =  # Select by uncommenting:
                              # :selenium
                              # :webkit
                              :poltergeist
