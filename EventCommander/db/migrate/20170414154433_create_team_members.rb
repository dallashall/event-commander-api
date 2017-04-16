# AR Model for team_member objects
class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :single_use_token, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
