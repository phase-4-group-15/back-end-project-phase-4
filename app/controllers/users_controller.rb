class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create
    wrap_parameters format: [:json]
  
    def create
      user = User.create!(permitted_params)
      if user.valid?
        session[:user_id] = user.id
        render json: user, serializer: UserSerializer, status: :created
      else
        render json: { error: "not valid data" }, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @current_user
    end
  
    def index
      articles = Article.all
      render json: articles, include: [:reviews], status: :ok
    end
  
    def show
      article = Article.find(params[:id])
      render json: article, include: [:reviews], status: :ok
    end
  
    def update
      article = Article.find(params[:id])
      review = article.reviews.find_or_initialize_by(user_id: @current_user.id)
      review.rating = params[:rating]
      if review.save
            render json: article, include: [:reviews], status: :ok
        else
            render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    private
    
    def permitted_params
        params.permit(:username, :password, :password_confirmation, :email)
    end
    
    def invalid_message(exception)
        render json: { errors: exception.message }, status: :unprocessable_entity
    end
end
  