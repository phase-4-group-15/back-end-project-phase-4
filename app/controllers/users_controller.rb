class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create
    wrap_parameters format: [:json]
  
    # post '/users/signup'
    def create
      user = User.create!(permitted_params)
      if user.valid?
        session[:user_id] = user.id
        render json: user, serializer: UserSerializer, status: :created
      else
        render json: { error: "not valid data" }, status: :unprocessable_entity
      end
    end
  
    # get '/me/:id', to: 'users#show'
    def show
      user = User.find_by(id: session[:user_id])
      if user
        render json: user
      else
        render json: {error: "User not authorized"}, status: 401
      end
    end

    # # post '/me/:id'
    # def show
    #   user = User.find_by!(id: session[:user_id])
    #   if user
    #     article = user.article.all
    #     render json: @current_user, include: [:reviews], status: :ok
    #   else
    #     render json: { error: "You are not logged in" }, status: :unprocessable_entity
    #   end
    # end
  
    #get '/users/articles'
    def index
      user = User.find_by!(id: session[:user_id])
      if user 
        articles = Article.all
        render json: articles, include: [:reviews], status: :ok
      else
        render json: { error: "You are not logged in"}, status: :unprocessable_entity
      end
    end
  
      #get '/users/reviews'
      def reviews
        user = User.find_by!(id: session[:user_id])
        if user 
          review = user.reviews.all
          if review
            # render json: { error: "You dont have any reviews"}, status: :not_found
            render json: review, status: :ok 
          else
            render json: { error: "You dont have any reviews"}, status: :not_found
            # render json: review, status: :ok 
          end
        else
          render json: { error: "You are not logged in"}, status: :unprocessable_entity
        end
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
    
    def permitted_params
        params.permit(:username, :password, :password_confirmation, :email, :bio)
    end
    
    def invalid_message(exception)
        render json: { errors: exception.message }, status: :unprocessable_entity
    end
end


# class UsersController < ApplicationController
#     rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
#     skip_before_action only: :create
#     wrap_parameters format: [:json]
  
#     # post '/users/signup'
#     def create
#       user = User.create!(permitted_params)
#       if user.valid?
#         session[:user_id] = user.id
#         render json: user, serializer: UserSerializer, status: :created
#       else
#         render json: { error: "not valid data" }, status: :unprocessable_entity
#       end
#     end
  
#     # post '/me/:id'
#     def show
#       user = User.find_by!(id: session[:user_id])
#       if user
#         article = user.articles.all
#         render json: articles, include: [:reviews], status: :ok
#       else
#         render json: { error: "You are not logged in" }, status: :unprocessable_entity
#       end
#     end
  
    # # get '/users/articles'
    # def index
    #   user = User.find_by!(id: session[:user_id])
    #   if user 
    #     articles = Article.all
    #     render json: articles, include: [:reviews], status: :ok
    #   else
    #     render json: { error: "You are not logged in"}, status: :unprocessable_entity
    #   end
    # end
  
#     def update
#       article = Article.find(params[:id])
#       review = article.reviews.find_or_initialize_by(user_id: @current_user.id)
#       review.rating = params[:rating]
#       if review.save
#             render json: article, include: [:reviews], status: :ok
#         else
#             render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
#         end
#     end
    
#     private
    
#     def permitted_params
#         params.permit(:username, :password, :password_confirmation, :email)
#     end
    
#     def invalid_message(exception)
#         render json: { errors: exception.message }, status: :unprocessable_entity
#     end
# end
  