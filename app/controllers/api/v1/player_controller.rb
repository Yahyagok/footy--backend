class Api::V1::PlayerController < ApplicationController


    def index 
        player = Player.all

        render json: player 
    end 

    def show 
        player = Player.find_by(params[:id])

        render json: player 
    end 
end
