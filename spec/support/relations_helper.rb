# encoding: utf-8

module RelationsHelper

  def null_relation
    klass.null_relation
  end

  def any_relation
    ActiveRecord::Relation.any_instance
  end

  def mock_relation
    @mock_relation ||= mock('relation')
  end
end

ActiveRecord::Base.instance_eval do
  # Soon to be replaced with Rails 4.
  def null_relation
    limit(0)
  end
end

RSpec.configure do |c|
  c.include RelationsHelper
end
