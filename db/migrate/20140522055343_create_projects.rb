class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :abbreviation
      t.date :start_date
      t.date :end_date
      t.integer :team_id
      t.integer :project_manager

      t.timestamps
    end
  end
end
