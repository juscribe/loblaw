# encoding: utf-8

# Patch, will move to fork:
# Normally the constantization happens within its current context such that a
# const missing or not loaded error pops. Need to either require the model classes
# yourself or add them to the autoload paths, but even with the latter, properly
# declaring context in which to search like below is required.
module FactoryGirl
  class Factory
    def build_class
      @build_class ||= if class_name.is_a? Class
        class_name
      else
        "::Loblaw::#{class_name.to_s.camelize}".constantize
      end
    end
  end
end

RSpec.lazy_configure { |c| c.include FactoryGirl::Syntax::Methods }
RSpec.lazy_each_run { FactoryGirl.reload }
