class CreateLoblawMessages < ActiveRecord::Migration
  def change
    create_table :loblaw_messages do |t|
      t.belongs_to :mailbox
      t.belongs_to :voice
      t.belongs_to :conversation
      t.text :reference_ids # blob dont work

      t.string :subject
      t.text :body

      t.integer :number
      t.integer :status

      t.timestamps
    end
  end
end
