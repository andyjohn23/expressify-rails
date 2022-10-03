class UsersController < ApplicationController
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:create, :index]

    def index
      users = User.all
      render json: users
    end

    def create
        user = User.create!(user_params)
        payload = {id: user.id, username: user.username, email: user.email}
        token = encoded_token(payload)
        render json: {token: token}
    end

    def show
        render json: @user
    end

    def update
        id = @user["id"]
        user = User.find(id)
        user.update!(user_params)
        render json: user
    end

    def destroy
        id = @user["id"]
        user = User.find(id)
        user.destroy
    end

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
