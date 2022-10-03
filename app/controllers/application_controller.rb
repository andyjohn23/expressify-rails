class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def render_unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  # payload token encode
  def encoded_token(payload)
      JWT.encode(payload, 'expressifyApiToken')
  end

  def authorized_user
      if decoded_token
          user_id = decoded_token[0]['id']
          @user = User.find(user_id)
          render json: { errors: ["You are not authorized"] }, status: :unauthorized unless @user
      else
          render json: { errors: ["You are not authorized"] }, status: :unauthorized
      end
  end

  # Authorization header check
  def auth_header
      request.headers['Authorization']
  end

  # decoding token bearer
  def decoded_token
      if auth_header
          token = auth_header.split(' ')[1]
      begin
          JWT.decode(token, 'expressifyApiToken', true, algorithm: 'HS256')
      rescue JWT::DecodeError
          nil
      end
      end
  end

  def record_not_found
      render json: { errors: ['Record not found'] }
  end
end
