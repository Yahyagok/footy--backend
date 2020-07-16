Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :clubs, only: [:index, :show]
      resources :matches, only: [:index, :show ]
      resources :players, only: [:index, :show, :update, :create ]
      resources :reviews, only: [:show, :update, :create]
      resources :likes, only: [:show, :update, :create]
      resources :user, only: [:show, :update, :create]

        end 
    end 
end
