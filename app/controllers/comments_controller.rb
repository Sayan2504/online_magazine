class CommentsController < ApplicationController
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to request.referrer
    else
      render "new"
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
