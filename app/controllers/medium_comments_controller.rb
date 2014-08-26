class MediumCommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:body, :commentable_type, :commentable_id)
  end
end
