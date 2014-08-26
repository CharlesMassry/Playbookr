class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    folder = comment_params[:commentable_type].downcase
    render "#{folder}_comments/create.js.erb"
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:body, :commentable_type, :commentable_id)
  end
end
