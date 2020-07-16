class Api::V1::PlayersController < ApplicationController

    before_action :find_player, only: [:show, :update]

    def index 
        players = Player.all

        render json: players 
    end 

    def show 

        render json: player 
    end

    def update 
        player = Player.find(params[:id])

    end 

    def create 
        player.create(player_params) 
    end 

    private 

    def player_params 
        params.reqire(:player).permit(:name, :match_id, :club_id, :number, :type, :country, :age)
    end 

    def find_player 
        player = Player.find(params[:id])

        render json: player
    end 
    
    
end
