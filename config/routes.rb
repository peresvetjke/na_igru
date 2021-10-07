Rails.application.routes.draw do
  devise_for :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "games#index"
  
  devise_for :players, skip: :all

  resources :games
end