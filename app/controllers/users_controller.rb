class UsersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
      users = User.all
      render json: users
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :accepted
    end

    def show
        current_user = User.find(session[:user_id])
        render json: current_user, status: :ok
    end

    def update
        user = User.find_by(id: params[:id])
        user.update!(user_params)
        render json: user
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: {}, status: :no_content
    end

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end
end
