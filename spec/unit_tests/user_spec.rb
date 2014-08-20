require "rails_helper"

describe User do
  it { should belong_to(:team) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
