class ApplicationController < ActionController::API
  include ActionController::Cookies

    # verify authorization headers
    def verify_auth
      auth_headers = request.headers['Authorization']
      if !auth_headers
          render json: {message: 'Your request is not authorized'}, status: 401
      else
          token = auth_headers.split(' ')[1]
          save_user_id(token)
      end
    end

    # store user id in session
    def save_user(id)
        session[:uid] = id
    end

end