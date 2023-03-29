class ArticlesController < ApplicationController

  before_action :verify_auth

  def index
    user = User.find_by(id: session[:user_id])
    if user
      articles = Article.all
      render json: articles
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      article = Article.find(params[:id])
      render json: @article
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def create
    article = Article.create(article_params)

    if article
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def update
    article = Article.find(params[:id])

    if article.update(article_params)
      render json: article
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  private

  def article_params
    params.permit(:title, :description, :image, :category, :author)
  end

end
  