class Api::PostsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_post, only: [:show, :destroy]
    skip_before_action :authorize, only: [:index, :show]

    def create 
        user = @current_user
        post = user.posts.create(post_params)
        post.save
        render json: post, status: :created
    end

    def index 
        posts = Post.all 
        render json: posts, status: :ok
    end

    def show
        post = @post
        render json: post, status: :ok
    end

    def update 
        user = @current_user
        post = user.posts.find(params[:id])
        post.update(post_params)
        render json: post, status: :accepted
    end

    def destroy 
        user = @current_user
        @post = user.posts.find(params[:id])
        @post.destroy
        head :no_content
    end

    private

    def post_params
        params.permit(:title, :content, :user_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'No Posts Found' }, status: :not_found
    end
end
