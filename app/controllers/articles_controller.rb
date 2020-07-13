class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, flash: { success: "Article has been successfully created" }
    else
      render "new"
    end
  end

  def edit
  end

  def destroy
    if @article.delete
      redirect_to articles_path, flash: { danger: "Article has been successfully deleted" }
    end
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, flash: { success: "Article has been successfully updated" }
    else
      render "edit"
    end
  end

  private

  def article_params
    params.require(:article).permit(:author, :title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end