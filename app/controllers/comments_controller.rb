class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
    #現在ログインしコメントしたユーザーのid(current_user.id)を、commentテーブルのuser_idに保存する
    #どのprototypeのリクエストかを保存するために、リクエストのparamsの中のprototype_idをcommentテーブルのprototype_idに保存する

