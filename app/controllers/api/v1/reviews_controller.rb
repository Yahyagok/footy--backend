class Api::V1::ReviewsController < ApplicationController


    before_action :find_review, only: [:show, :update]


    def show 
        render json: review  
    end 

    def update 
        review.update(review_params)

        if review.save 
            render json: review, status: :accepted
        else
            render json: { errors: review.errors.full_messages }, status: :unprocessible_entity
        end 
    end 

    private 

    def review_params 
        params.reqiure(:review).permit(:user_id, :player_id)
    
    end 

    def create 
       review = Review.create(review_params)
        if review.save
            render json: ReviewSerializer.new(review), status: :accepted
          else
            render json: { errors: review.errors.full_messages }, status: :unprocessible_entity
          end 
    end 


    def find_review 
        review = Review.find(params[:id])
    end


    
end

