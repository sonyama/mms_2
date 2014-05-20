class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :description
      t.integer :team_leader

      t.timestamps
    end
  end
end
