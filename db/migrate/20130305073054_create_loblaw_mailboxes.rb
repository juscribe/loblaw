class CreateLoblawMailboxes < ActiveRecord::Migration
  def change
    create_table :loblaw_mailboxes do |t|
      t.belongs_to :mailboxable, polymorphic: true
      t.datetime :checked_at
      t.string :time_zone
      t.timestamps
    end
  end
end
