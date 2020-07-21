class Api::V1::LikesController < ApplicationController

    before_action :find_like, only: [:update, :create]

    def show 
        like = Like.find_by(params[:id])
        render json: LikeSerializer.new(like)
    end 

    def update
        like.update(like_params)
        if like.save 
            render json: LikeSerializer.new(like), status: :accepted
        else
            render json: { errors: like.errors.full_messages }, status: :unprocessible_entity
        end 
    end 

    def create
     like = Like.create(like_params)
      if like.valid? 
        render json: like
      else
        render json: { errors: like.errors.full_messages }, status: :unprocessible_entity
      end 
    end 


    private 

    def like_params 
        params.require(:like).permit(:user, :player)
    end 


    def find_like 
        like = Like.find(params[:id])
    end 

    

end
