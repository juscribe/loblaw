class CreateLoblawConversations < ActiveRecord::Migration
  def change
    create_table :loblaw_conversations do |t|
      t.belongs_to :starter
      t.string :title
      t.string :permalink
      t.text :description

      t.integer :status
      t.string :token
      t.datetime :wrapped_up_at

      t.integer :messages_count, default: 0
      t.integer :views_count, default: 0
      t.integer :participants_count, default: 0
      t.timestamps
    end
  end
end
