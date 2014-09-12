class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :plays, dependent: :destroy
  has_many :player_stats

  def players
    users.where(role: "Player")
  end
end
