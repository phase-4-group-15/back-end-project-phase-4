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

#      # rescue all common errors
#   def standard_error(exception)
#      app_response(message: 'failed', data: { info: exception.message }, status: :unprocessable_entity)
#   end

#      # rescue all common errors
#   def standard_error(exception)
#      app_response(message: 'failed', data: { info: exception.message }, status: :unprocessable_entity)
#   end
end


  # rescue_from StandardError, with: :standard_error

  def app_response(message: 'success', status: 200, data: nil)
      render json: {
          message: message,
          data: data
      }, status: status
  end
  
  #  # store user id in session
  #  def save_user(id)
  #     session[:uid] = id
  #     session[:expiry] = 6.hours.from_now
  #  end

  #  # delete user id in session
  #  def remove_user
  #     session.delete(:uid)
  #     session[:expiry] = Time.now
  #  end

  #  # check for session expiry
  #  def session_expired?
  #     session[:expiry] ||= Time.now
  #     time_diff = (Time.parse(session[:expiry]) - Time.now).to_i
  #     unless time_diff > 0
  #         app_response(message: 'failed', status: 401, data: { info: 'Your session has expired. Please login again to continue' })
  #     end
  #  end

  #   # get logged in user
  # def user
  #    User.find(session[:uid].to_i) 
  # end

  #    # rescue all common errors
  # def standard_error(exception)
  #    app_response(message: 'failed', data: { info: exception.message }, status: :unprocessable_entity)
  # end
  














    # # verify authorization headers
    # def verify_auth
    #   auth_headers = request.headers['Authorization']
    #   if !auth_headers
    #       render json: {message: 'Your request is not authorized'}, status: 401
    #   else
    #       token = auth_headers.split(' ')[1]
    #       save_user_id(token)
    #   end
    # end

    # # store user id in session
    # def save_user(id)
    #     session[:uid] = id
    # end

