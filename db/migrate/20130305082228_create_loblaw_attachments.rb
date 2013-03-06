class CreateLoblawAttachments < ActiveRecord::Migration
  def change
    create_table :loblaw_attachments do |t|
      t.belongs_to :mailbox
      t.belongs_to :message
      t.belongs_to :attachable, polymorphic: true
      t.string :mime_type
      t.integer :position
      t.integer :file_size
      t.timestamps
    end
  end
end
