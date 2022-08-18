class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    before_action :authorize 
  
    private
    
    def authorize 
      @current_user = User.find_by(id: session[:user_id])
    end

    def record_not_found(errors)
      render json: errors.message, status: :not_found
    end
  
    def invalid_record(invalid)
      render json: invalid.records.errors, status: :unprocessable_entity
    end
end
