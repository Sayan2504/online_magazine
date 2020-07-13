class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = Article.find(@comment.article_id).id
    if @comment.save
      redirect_to article_path(@comment.article_id), flash: { success: "Comment has been successfully created" }
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
    @article = Article.find(params[:article_id])
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
    params.require(:comment).permit(:commenter, :comment, :article_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
