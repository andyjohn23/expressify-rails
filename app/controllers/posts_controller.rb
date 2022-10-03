class PostsController < ApplicationController
    before_action :authorized_user
    skip_before_action :authorized_user, only: [:index, :show]
    
    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        @post = Post.create!(post_params)
        render json: @post
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render json: @post, status: :ok
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end
        
    private

    def post_params
        params.permit(:title, :content, :location, :user_id)
    end
end
