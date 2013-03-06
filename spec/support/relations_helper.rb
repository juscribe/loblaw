# encoding: utf-8
module RelationsHelper

  def null_relation
    klass.null_relation
  end

  def any_relation
    ActiveRecord::Relation.any_instance
  end
end

ActiveRecord::Base.instance_eval do

  def null_relation
    limit(0)
  end
end

RSpec.configure do |c|
  c.include RelationsHelper
end
