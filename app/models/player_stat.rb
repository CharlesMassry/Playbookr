class PlayerStat < ActiveRecord::Base
  include Enumerable
  belongs_to :team
  belongs_to :player, class_name: "User"

  validates :team, presence: true
  validates :player, presence: true

  def each(&block)
    stats.each(&block)
  end

  def statistics
    stats || NullStat.new
  end

  def columns
    team.team_stat_column || NullTeamStatColumn.new
  end
end
