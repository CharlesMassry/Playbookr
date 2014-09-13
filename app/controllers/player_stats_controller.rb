class PlayerStatsController < ApplicationController
  def show
    @team_stat_column = current_user.team.team_stat_column
    @players = current_user.team.players
  end
end
