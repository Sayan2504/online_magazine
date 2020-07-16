class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def create
    @article = Article.new(article_params)
    @article.user = User.find(@article.user_id)
    if @article.save
      redirect_to articles_path, flash: { success: "Article has been successfully created" }
    else
      render "new"
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def destroy
    if @article.delete
      redirect_to articles_path, flash: { danger: "Article has been successfully deleted" }
    end
  end

  def index
    @articles = Article.all.order("updated_at DESC")
    if params[:author]
      @articles = @articles.article_author(params[:author])
    end 
    if params[:title]
      @articles = @articles.article_title(params[:title])
    end
  end

  def new
    @user = User.find(current_user.id)
    @article = Article.new
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id), flash: { success: "Article has been successfully updated" }
    else
      render "edit"
    end
  end

  def comments_section_reload
    render partial: "articles/comments"
  end

  private

  def article_params
    params.require(:article).permit(:author, :title, :body, :user_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end