class CreateLoblawUsers < ActiveRecord::Migration
  def change
    create_table :loblaw_users do |t|
      t.belongs_to :user

      t.string :email
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
