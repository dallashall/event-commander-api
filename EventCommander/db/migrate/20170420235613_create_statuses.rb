class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :team_member_id, null: false
      t.integer :detail_id, null: false
      t.integer :confirmed, null: false, default: 0

      t.timestamps
    end
  end
end
