class CreateTeamStatColumns < ActiveRecord::Migration
  def change
    create_table :team_stat_columns do |t|
      t.text :column_names
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
