require "rails_helper"

describe Medium do
  it { should belong_to(:play) }
  it { should have_one(:team) }
  it { should belong_to(:content) }
  it { should validate_presence_of(:play) }
  it { should validate_presence_of(:content) }
end
