class PlayerStatsController < ApplicationController
  before_action :verify_team

  def show
    team = find_team
    @player_stat_column = team.player_stat_columns
    @players = team.players
  end

  def find_team
    Team.find(params[:team_id])
  end
end
