class PlayerStatsController < ApplicationController
  def show
    team = current_user.team
    @team_stat_column = team.team_stat_column
    @players = team.players
  end
end
