Rails.application.routes.draw do
  devise_for :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "games#index"
  
  devise_for :players, skip: :all

  resources :players, shallow: true do
    resources :invites
  end

  resources :notifications, only: :index do
      get   :unviewed, on: :collection
      patch :mark_as_read, on: :collection
  end

  resources :locations do
    patch :update_inline, on: :member
  end

  resources :games, shallow: true do
    resources :game_players
  end
end
