class Api::V1::MatchesController < ApplicationController

    before_action :find_match, only: [:show]


    def index 
        matches = Match.all
        render json: MatchSerializer.new(matches)
    end 

    def show 

        render json: match
    end 


    private 


    def find_match 
        match = Match.find(params[:id])
    end

    
    
 


    

end
