class AddNotNullToPlaysTeamId < ActiveRecord::Migration
  def change
    change_column_null :plays, :team_id, false
  end
end
