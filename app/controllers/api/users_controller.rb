class Api::UsersController < ApplicationController

    skip_before_action :authorize, only: :create

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        users = User.all
        render json: users, each_serializer: UserIndexSerializer, status: :ok
    end

    def show
        user = @current_user
        render json: user, include: ['posts']
    end

    def update
        user = @current_user
        user.update(user_params)
        render json: user, include: ['posts']
    end

    def destroy
        @current_user.destroy
        head :no_content

    end

    private 

    def user_params
        params.permit(:email, :username, :location, :password, :password_confirmation, :posts)
    end
end
