class CommentsController < ApplicationController
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
end
