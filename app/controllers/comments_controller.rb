class CommentsController < ApplicationController
  before_filter :verify_team

  def create
    @comment = current_user.comments.create(comment_params)
    file = comment_params[:commentable_type].downcase
    render "create_#{file}_comment"
  end

  def destroy
    comment = find_comment
    comment.destroy
  end

  private

  def find_comment
    Comment.find(params[:id])
  end

  def comment_params
    params.
      require(:comment).
      permit(:body, :commentable_type, :commentable_id)
  end

  def find_team
    Team.find(params[:team_id])
  end
end
