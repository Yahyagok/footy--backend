class Api::V1::UsersController < ApplicationController

    before_action :find_user, only: [:update, :create]

    def show 
        render json: user 
    end 

    def update 
        user.update

        if user.save 
            render json: user, status: :accepted
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
        end 
    end 

    def create 
      user = User.new(user_params)
        if user.save 
            render json: UserSerializer.new(user), statu: :accepted
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
          end 
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :club_id)
    end
    
    def find_user
        user = User.find(params[:id])
    end 


end
