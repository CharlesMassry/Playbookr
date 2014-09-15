json.player_stat_column @player_stat_column.names

json.players @players do |player|
  json.email player.email
  json.stats player.player_stat.statistics
end
