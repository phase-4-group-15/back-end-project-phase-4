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

    # patch '/reset/:id' 
    def reset_password
      user = User.find_by(username: params[:username])
      if user
        user.update(params.permit(:password))
        render json: user, status: :created
        # render json: {message: 'password reset'}, status: :created
      else
        render json: { error: "Not authorized"}, status: :unauthorized
      end
    end

    # def reset_password
    #   user = User.find_by(username: params[:username])
    #   if user
    #     user.send_password_reset
    #     render json: { message: 'Instructions for resetting your password have been sent to your email.' }
    #   else
    #     render json: { message: 'User not found.' }, status: :not_found
    #   end
    # end


    private

    def user_params
      params.permit(:username, :password, :password_confirmation, :email, :bio)
    end


end


  