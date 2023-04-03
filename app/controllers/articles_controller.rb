class ArticlesController < ApplicationController
    before_action :require_login, except: [:index, :show, :like, :dislike, :destroy, :create ]
  
  
    def index
      articles = Article.all
      render json: articles
    end
  
    def show
      article = Article.includes(reviews: :user).find_by(id: params[:id])
      if article
        render json: {
          id: article.id,
          title: article.title,
          description: article.description,
          image: article.image,
          reviews: article.reviews.map do |review|
            {
              id: review.id,
              rating: review.rating,
              comment: review.comment,
              user: {
                id: review.user.id,
                name: review.user.username,
                bio: review.user.bio
              }
            }
          end
        }
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
    
  
 

    def create
      article = Article.new(title: params[:title], category: params[:category], description: params[:description], image: params[:image], user_id: params[:userId])
    
      if article.save
        render json: article, status: :created
      else
        render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
      end
    end
    

    def update
      article = Article.find_by(id: params[:id])
      if article && article.user == current_user
        if article.update(article_params)
          render json: article
        else
          render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Article not found or unauthorized" }, status: :not_found
      end
    end
  
    def destroy
      article = Article.find_by(id: params[:id])
      if article
        article.destroy
        head :no_content
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
  
    def like
      article = Article.find_by(id: params[:id])
      if article
        article.likes += 1
        article.save
        render json: article
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
    def dislike
      article = Article.find_by(id: params[:id])
      if article
        article.dislikes += 1
        article.save
        render json: article
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
    private
  
    def article_params
      params.permit(:title, :category, :description, :image, :userId)
    end
  
  end
  






