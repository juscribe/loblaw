notification :growl, sticky: false, host: '127.0.0.1'

guard 'spork', rspec_env: { 'RAILS_ENV' => 'test' }, rspec: true do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch(%r{^.+\.gemspec$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch(%r{^lib/.+\.rb$})
  watch(%r{^spec/(spec|turnip)_helper.rb$}) { :rspec }
end

guard 'rspec', cli: '--drb', notification: true, all_on_start: true, all_after_pass: true do
  watch('')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  # watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/(.+/)(_?[^/]+)\.(erb|haml)$})         { |m| Dir["spec/#{m[1]}#{m[2]}.erb_spec.rb"][0] || "spec/#{m[1]}" }
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
  watch(%r{^spec/factories/(.+)\.rb$})                { 'spec' }
  watch(%r{^lib/(.+)\.rb$})                           { 'spec' }
  watch('config/routes.rb')                           { %w(spec/routing spec/requests spec/acceptance) }
  watch('app/controllers/application_controller.rb')  { %w(spec/controllers spec/requests spec/acceptance) }

  # Capybara features specs
  # watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch('spec/turnip_helper.rb') { 'spec/acceptance' }
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end

guard 'jasmine-headless-webkit', all_on_start: true do
  spec_location = "spec/javascripts/%s_spec"
  watch(%r{^app/views/.*\.jst$})
  watch(%r{^public/javascripts/(.*)\.js$}) { |m| newest_js_file(spec_location % m[1]) }
  watch(%r{^app/assets/javascripts/(.*)\.(js|coffee)$}) { |m| newest_js_file(spec_location % m[1]) }
  watch(%r{^spec/javascripts/(.*)_spec\..*}) { |m| newest_js_file(spec_location % m[1]) }
end
