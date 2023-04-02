class JsonWebTokenHelper
    def self.authorized(request)
      token = extract_token(request)
      if token
        begin
          decoded_token = decode_token(token)
          return User.find(decoded_token[:user_id])
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          return nil
        end
      end
      return nil
    end
  
    private
  
    def self.extract_token(request)
      if request.headers['Authorization'].present?
        return request.headers['Authorization'].split(' ').last
      elsif request.cookies['jwt'].present?
        return request.cookies['jwt']
      end
      return nil
    end
  
    def self.decode_token(token)
      return JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    end
  end
  