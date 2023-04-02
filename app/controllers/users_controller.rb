class UsersController < ApplicationController

    # create a user
    def create
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    # keep the user logged in "/me"
    def show
        user = User.find_by(id: session[:user_id])
        if user 
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
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

    def reset_password
      user = User.find(params[:id])

      if user
        user.update(params.permit(:password))
        render json: user, status: :created
      else
        render json: { error: "Not authorized"}, status: :unauthorized
      end
    end

    private

    def user_params
      params.permit(:username, :password, :password_confirmation, :email, :bio)
    end


end


  