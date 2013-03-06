class CreateLoblawVoices < ActiveRecord::Migration
  def change
    create_table :loblaw_voices do |t|
      t.belongs_to :owner
      t.belongs_to :graph
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
