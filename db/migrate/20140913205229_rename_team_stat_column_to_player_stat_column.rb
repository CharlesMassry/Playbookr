class RenameTeamStatColumnToPlayerStatColumn < ActiveRecord::Migration
  def change
    rename_column :team_stat_columns, :column_names, :names
    rename_table :team_stat_columns, :player_stat_columns
  end
end
