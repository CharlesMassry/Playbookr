class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :plays, dependent: :destroy
  has_many :player_stats
  has_one :player_stat_column

  def players
    users.where(role: "Player")
  end
end
