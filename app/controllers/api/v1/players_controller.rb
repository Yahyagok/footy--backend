class Api::V1::PlayersController < ApplicationController

    before_action :find_player, only: [:show, :update]

    def index 
        players = Player.all

        render json: PlayerSerializer.new(players)
    end 

    def show 

        render json: player 
    end

    def update 
        player = Player.find(params[:id])

    end 

    def create 
       player = Player.create(player_params) 

       if player.save 
        render json: PlayerSerializer.new(player), status: :accepted
       else 
        render json: {errors: player.errors.ful_messages},  status: :unprocessible_entity
       end
    end

    private 

    def player_params 
        params.require(:player).permit(:name, :match_id, :club_id, :number, :kind, :country, :age)
    end 

    def find_player 
        player = Player.find(params[:id])

        render json: player
    end 
    
    
end
