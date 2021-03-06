class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :event_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :teams, :event_id
  end
end
