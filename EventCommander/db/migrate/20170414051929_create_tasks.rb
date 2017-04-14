class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :order, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
    add_index :tasks, :event_id
  end
end
