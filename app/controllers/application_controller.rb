class ApplicationController < ActionController::API
  include ActionController::Cookies

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




    rescue_from StandardError, with: :standard_error

    # hash data into web token
    def encode(uid, email)
        payload = {
            data: {
                uid: uid,
                email: email,
                role: 'admin'
            }
        }
        JWT.encode(payload, ENV['task_train_key'], 'HS256')
    end

    # unhash the token
    def decode(token)
        JWT.decode(token, ENV['task_train_key'], true, { algorithm: 'HS256' })
    end

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

    # get logged in user
    def user
        User.find(@uid) 
    end

    # save user's id
    def save_user_id(token)
        @uid = decode(token)[0]["data"]["uid"].to_i
    end

    # get logged in user (session)
    def user_session
        User.find(session[:uid].to_i) 
    end

    # rescue all common errors
    def standard_error(exception)
      render json: {message: exception.message}, status: 422

    end

end