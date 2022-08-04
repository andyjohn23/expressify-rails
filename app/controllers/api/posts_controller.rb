class Api::PostsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_post, only: [:show, :destroy]
    skip_before_action :authorize, only: [:index, :show]

    def create 
        user = @current_user
        post = user.posts.create(post_params)
        post_user.isAdmin = true
        post_user.save
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
        @post = Post.find_by(id: params[:id])
        unless user?(@post.user)
          redirect_to user_path(current_user)
        end
        render json: post, status: :accepted
    end

    private

    def posts_params
        params.permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'No Posts Found' }, status: :not_found
    end
end
