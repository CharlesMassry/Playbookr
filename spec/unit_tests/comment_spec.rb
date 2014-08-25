require 'rails_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:commentable) }
end
