class Api::V1::ClubsController < ApplicationController
    before_action :find_club, only: [:show, :update]

    def index 
        clubs = Club.all
        render json: ClubSerializer.new(clubs)
    end
    
    def show 
        
        render json: club 
    end 


    def update
        club.update(club_params)
        if club.save 
            render json: ClubSerializer.new(club), status: :accepted
        else
            render json: { errors: club.errors.full_messages }, status: :unprocessible_entity
        end 
    end 

    private 

    def club_params 
        params.require(:club).permit(:name, :badge)
    end 

    def find_club 
        club = Club.find(params[:id])
    end 



end
