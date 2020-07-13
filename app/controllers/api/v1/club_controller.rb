class Api::V1::ClubController < ApplicationController
    before_action :find_club, only: [:show]

    def index 
        clubs = Club.all
        render json: club
    end
    
    def show 
        
        render json: club 
    end 

    private 

    def clup_params 
        params.permit(:name, :badge, :coach)
    end 

    def find_club 
        club = Club.find(params[:id])
    end 



end
