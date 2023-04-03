class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      render json: { error: "You must be logged in to access this  resource" }, status: :unauthorized
    end
  end

    # store user id in session
   def save_user(id)
      session[:uid] = id
      session[:expiry] = 6.hours.from_now
   end

  # verify authorization headers
  def verify_auth
    auth_headers = request.headers['Authorization']
    if !auth_headers
        render json: {message: 'Your request is not authorized'}, status: 401
    else
        token = auth_headers.split(' ')[1]
        save_user(token)
    end
  end

end