class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    skip_before_action only: :create
    wrap_parameters format: [:json]
    def create
        user = User.create!(permitted_params)
        session[:user_id] = user.id
        render json: user, serializer: UserCreateMethodSerializer, status: :created
    end

    def show
        render json: @current_user
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, serializer: UserCreateMethodSerializer
        else
          render json: { errors: "Invalid username or password" }, status: :unauthorized
        end
    end

    private  

    def permitted_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def invalid_message(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end