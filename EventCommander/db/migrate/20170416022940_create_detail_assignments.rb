class CreateDetailAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_assignments do |t|
      t.integer :team_id
      t.integer :detail_id

      t.timestamps
    end
    add_index :detail_assignments, :team_id
    add_index :detail_assignments, :detail_id
  end
end
