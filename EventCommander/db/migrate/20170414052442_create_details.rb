class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.integer :task_id, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :details, :task_id
  end
end
