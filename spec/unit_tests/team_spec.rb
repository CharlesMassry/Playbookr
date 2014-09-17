require "rails_helper"

describe Team do
  it { should have_many(:users) }
  it { should have_many(:player_stats) }
  it { should have_one(:player_stat_column) }
  it { should have_many(:plays) }
end
