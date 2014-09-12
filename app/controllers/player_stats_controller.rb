class PlayerStatsController < ApplicationController
  def show
    team = current_user.team
    @players = team.players
    @stat_columns = team.player_stats.columns
  end
end
