class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.date :event_date

      t.timestamps
    end
    add_index :events, :user_id
  end
end
