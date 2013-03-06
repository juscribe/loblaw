module Loblaw
  class Attachment < ActiveRecord::Base
    belongs_to :message, inverse_of: :attachments
    belongs_to :attachable, polymorphic: true

    # mime_type
    # attr_accessible :title, :body
  end
end
