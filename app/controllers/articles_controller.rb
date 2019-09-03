class ArticlesController < ApplicationController
  before_action :set_articles, only: [:index]
  before_action :set_article, only: [:edit, :show]

  def index; end

  def show; end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    go_home
  end

  def edit; end

  def update
    set_article
    @article.update(article_params)
    go_home
  end

  def destroy
    set_article.destroy
    go_home
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_articles
    @articles = Article.all
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def go_home
    redirect_to articles_path
  end
end
