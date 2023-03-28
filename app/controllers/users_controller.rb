class UsersController < ApplicationController
    
    def register 
        user = User.create(user_params)
        if user.valid?
            save_user(user.id)
            app_response(message: 'Registration was successfull', data: user)
        else
            app_response(message: 'Something went wrong during registration', status: :unprocessable_entity, data: user.errors)
        end
    end

    def login
        user = User.find_by(user_params)
        if user&.authenticate(user_params[:password])
            save_user(user.id)
            app_response(message: "Login was successfull", status: :ok, data: { user: user})
        else
            app_response(message: "Invalid username/email or password", status: :unauthorized)
        end
        
    end

    def logout
        remove_user
        app_response(message: 'Logout successful')
    end

    private

    def user_params 
        params.permit(:username, :email, :password)
    end
end
