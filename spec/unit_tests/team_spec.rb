require "rails_helper"

describe Team do
  it { should have_many(:users) }
  it { should have_many(:plays) }
end
