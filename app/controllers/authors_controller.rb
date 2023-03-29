class AuthorsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create 

    # signup
    def create
        user = Author.create!(author_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Wrong password. Please try again.", "User not found. Please sign up"] }, status: :unauthorized
        end
    end

    def login
        user = Author.find_by(name: params[:name])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Wrong password. Please try again.", "User not found. Please sign up"] }, status: :unauthorized
        end
    end
    # get '/articles'
    def index
        articles = Article.all
        render json: articles
    end

    # get '/authors/:id'
    def show
        author = Author.find(params[:id])
        if author
            article = author.article.all
            render json: article
        else
            render json: {error: "Author cannot be found"}, status: :unprocessable_entity
        end
    end
    
    # get 'authors'
    def author_index
        author = Author.all
        render json: author
    end

    private 

    def author_params 
        params.permit(:name, :email, :password, :password_confirmation, :confirm_password)
    end
    
    def invalid_message(exception)
        render json: { errors: exception.message }, status: :unprocessable_entity
    end
end
