class SessionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create
    wrap_parameters format: [:json]


    # POST '/signup'
    def create
        user = User.create!(user_params)

        if user.valid?
            session[:user_id] = user.id 
            render json: user, serializer: UserSerializer, status: :created
        else
            render json: { error: "not valid data" }, status: :unprocessable_entity
        end
    end

    # get '/me', to: 'users#show'
    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "User not authorized"}, status: 401
        end
    end
    
    # POST '/login'
    def login
        user= User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            token = encode(user.id, user.email)
            render json: user, status: :created, serializer: UserSerializer
        else
            render json: {errors: "Invalid username or password"}, status: :unauthorized
        end
    end

    # DELETE '/logout'
    def logout
        user = User.find_by(id: session[:user_id])

        if user 
            session.delete :user_id
            head :no_content
        else
            render json: { error: "You are not logged in"}, status: :unprocessable_entity
        end
    end

    # GET '/articles'
    def index
        user = User.find_by(id: session[:user_id])

        articles = Article.all
        art = articles.to_json(
            only: [:title, :description, :image, :category, :likes, :dislikes], 
            include: [ author: { only: [:name] } ],
            include: [ user: {only: [:username]}],
            include: [reviews: { only: [:user_id] }]
        )
        if user 
          session[:user_id] = user.id
          render json: art, status: :ok
        else
          render json: { error: "You are not logged in"}, status: :unprocessable_entity
        end

    end

    # def reviews
    #     user = User.find_by(id: session[:user_id])
    #     if user 
    #       review = user.reviews.all
    #       if review
    #         render json: review.to_json(only: [:likes, :dislikes], include: [ user: {only: [:username]}, article: {only: [:title]} ]) ,status: :ok 
    #       else
    #         render json: { error: "You dont have any reviews"}, status: :not_found
    #       end
    #     else
    #       render json: { error: "You are not logged in"}, status: :unprocessable_entity
    #     end
    # end

    private

    def user_params
        params.permit(:username,:email, :password, :password_confirmation, :bio)
    end

    def author_params 
        params.permit(:name, :email, :password, :password_confirmation, :bio)
    end
    
    def invalid_message(exception)
        render json: { errors: exception.message }, status: :unprocessable_entity
    end
end