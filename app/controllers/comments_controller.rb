class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @create.save
      redirect_to prototype_path
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: prototype_id:)
  end
end
