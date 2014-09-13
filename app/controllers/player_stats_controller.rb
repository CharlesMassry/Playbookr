class PlayerStatsController < ApplicationController
  def show
    @player_stat_column = current_user.team.player_stat_column
    @players = current_user.team.players
  end
end
