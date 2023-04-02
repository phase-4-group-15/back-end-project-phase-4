class Authorization 

    def initialize(request)
      @token = request.headers[:HTTP_TOKEN]
    end

    def current_user
      JsonWebToken.decode(@token)[:user_id] if @token
    end

    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless current_user?
    end
end
