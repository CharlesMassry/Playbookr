class CommentsController < ApplicationController
  before_filter :verify_team

  def create
    @comment = current_user.comments.create(comment_params)
    file = comment_params[:commentable_type].downcase
    render "create_#{file}_comment"
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:body, :commentable_type, :commentable_id)
  end

  def find_team
    Team.find(params[:team_id])
  end

  def verify_team
    if current_user.team != find_team
      flash[:error] = "You may only access your own team."
      redirect_to current_user.team
    end
  end
end
