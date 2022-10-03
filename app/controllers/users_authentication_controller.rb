class UsersAuthenticationController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            payload = {id: user.id, username: user.username, email: user.email}
            token = encoded_token(payload)
            render json: {token: token}
        else
            render json: { errors: ["Invalid email or password"]}, status: :unauthorized
        end
    end
end
