class CreateLoblawGraphs < ActiveRecord::Migration
  def change
    create_table :loblaw_graphs do |t|
      t.string :name
      t.timestamps
    end
  end
end
