class SessionsController < ApplicationController

    # login a user
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { sessionId: session.id, user: user }, status: :created
        else
        ren der json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    # logout the user
    def destroy  
        session.delete(:user_id)
    end
end