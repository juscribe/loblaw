# encoding: utf-8

module MailerMacros
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def reset_email
    ActionMailer::Base.deliveries = []
  end
end

RSpec.lazy_configure { |c| c.include MailerMacros }
