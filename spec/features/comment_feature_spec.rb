require "rails_helper"

feature "User comments" do
  before(:each) do
    @team = create(:team)
    @user = create(:user, team: @team)
    @play = create(:play, team: @team)
    play_comment = create(:play_comment, user: @user, commentable: @play)

    sign_in @user
    visit team_play_path(@team, @play)
  end

  scenario "on play", js: true do
    comment = build(:play_comment)

    click_button "Add comment to play"
    fill_in "Comment", with: comment.body
    click_button "Add comment"

    expect(page).to have_content(comment.body)
  end

  scenario "on comment", js: true do
    comment = build(:comment_comment)

    click_button "Reply"
    fill_in "Comment", with: comment.body
    click_button "Add comment"

    expect(page).to have_content(comment.body)
  end
end
