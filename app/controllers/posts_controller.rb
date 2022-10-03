class PostsController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
        posts = Post.all
        render json: posts
    end

    def create
        post = Post.create!(post_params)
        render json: post
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post, status: :ok
        else
            render json: post.errors, status: :unprocessable_entity
        end
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: {}, status: :no_content
    end
        
    private

    def post_params
        params.permit(:title, :content, :location, :image_url, :user_id)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end
end
