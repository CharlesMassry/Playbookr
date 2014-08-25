require "rails_helper"

describe Play do
  it { should belong_to(:team) }
  it { should have_many(:media) }
  it { should have_many(:comments) }
end
