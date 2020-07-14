class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to request.referrer
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(@comment.article.id)
  end

  def destroy
    if @comment.delete
      redirect_to article_path(@comment.article.id), flash: { danger: "Comment has been successfully deleted" }
    end
  end

  def new
    @comment = Comment.new
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@comment.article.id), flash: { success: "Comment has been successfully updated" }
    else
      render "edit"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
