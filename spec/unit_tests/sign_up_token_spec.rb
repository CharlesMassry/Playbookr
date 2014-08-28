require "rails_helper"

describe SignUpToken do
  it { should belong_to(:team) }
  it { should validate_presence_of(:team) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:email) }
end
