require "rails_helper"

describe User do
  it { should belong_to(:team) }
  it { should have_many(:comments) }
  it { should have_many(:plays) }
  it { should have_one(:player_stat) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  describe "#coach?" do
    before do
      @coach = create(:user)
      @player = create(:player)
    end

    it "is expected to return true for a coach" do
      expect(@coach.coach?).to eq(true)
    end

    it "is expected to return false for a player" do
      expect(@player.coach?).to eq(false)
    end
  end

  describe "#player?" do
    before do
      @coach = create(:user)
      @player = create(:player)
    end

    it "is expected to return false for a coach" do
      expect(@coach.player?).to eq(false)
    end

    it "is expected to return true for a player" do
      expect(@player.player?).to eq(true)
    end
  end

  describe "#permission_to_change_comment?" do
    before do
      @user = create(:user)
      @player = create(:player)
    end

    it "is expected to return true for a coach" do
      comment = create(:play_comment, user: @user)

      expect(@user.permission_to_change_comment?(comment)).to eq(true)
    end

    it "is expected to return false for a player who did not create the comment" do
      comment = create(:play_comment, user: @user)

      expect(@player.permission_to_change_comment?(comment)).to eq(false)
    end

    it "is expected to return true for a player who created the comment" do
      comment = create(:play_comment, user: @player)

      expect(@player.permission_to_change_comment?(comment)).to eq(true)
    end
  end
end
