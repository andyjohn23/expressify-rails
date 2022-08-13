class Api::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, include: ['posts'], status: :created
        else
            render json: { errors: ["Either email or password is invalid!"] }, status: :unauthorized
        end
    end

    def destroy 
        session.delete :user_id 
        head :no_content
    end
end
