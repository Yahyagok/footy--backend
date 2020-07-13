class Api::V1::LikesController < ApplicationController

    def show 
        like = Like.find_by(params[:id])
        render json: like 
    end 

    

end
