class AuthorsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create 
    wrap_parameters format: [:json]

    # POST '/signup'
    def create
        author = Author.create!(author_params)
        if author.valid?
            session[:user_id] = author.id
            render json: author, status: :created
        else
            render json: { errors: ["Wrong password. Please try again.", "User not found. Please sign up"] }, status: :unauthorized
        end
    end

    def login
        author= Author.find_by(name: params[:name])
        if author&.authenticate(params[:password])
            session[:author_id] = author.id
            render json: author, status: :created
        else
            render json: { errors: ["Wrong password. Please try again.", "User not found. Please sign up"] }, status: :unauthorized
        end
    end

    def logout
        session.delete :user_id
        head :no_content
    end
    
    # get '/authors/articles'
    def index
        author = Author.find_by(id: session[:user_id])
        if author
            articles = Article.all
            render json: articles.to_json(only: [:title, :description, :image, :category], include: [ author: {only: [:name]} , reviews: {only: [:likes, :dislikes]}]), include: [:reviews], status: :ok
        else
            render json: { error: "You are not logged in"}, status: :unprocessable_entity
        end
    end

    # get '/authors/:id'
    def show
        author = Author.find_by(id: session[:user_id])
        if author
            article = author.articles.all
            render json: article, include: [:reviews], status: :ok
        else
            render json: {error: "Author article cannot be found"}, status: :unprocessable_entity
        end
    end
    
    # get 'authors'
    def author_index
        author = Author.all
        render json: author
    end

    def update
        article = Article.find(params[:id])
        review = article.reviews.find_or_initialize_by(user_id: @current_user.id)
        review.likes = params[:likes]
        if review.save
              render json: article, include: [:reviews], status: :ok
          else
              render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
          end
    end

    private 

    def author_params 
        params.permit(:name, :email, :password, :password_confirmation, :bio)
    end
    
    def invalid_message(exception)
        render json: { errors: exception.message }, status: :unprocessable_entity
    end
end
