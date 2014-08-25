class PlayCommentsController < ApplicationController
  def create
    @comment = Comment.create(
      body: comment_params[:body],
      commentable_type: comment_params[:commentable_type],
      commentable_id: comment_params[:commentable_id],
      user: current_user
    )
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:body, :commentable_type, :commentable_id)
  end
end
