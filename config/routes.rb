Rails.application.routes.draw do
  devise_for :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "games#index"
  
  devise_scope :player do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    delete "/sign_out" => "devise/sessions#destroy"
  end

  devise_for :players, skip: :all

  resources :players, shallow: true

  resources :notifications, only: :index do
      get   :unviewed, on: :collection
      patch :mark_as_read, on: :collection
  end

  resources :locations do
    patch :update_inline, on: :member
  end

  resources :games, shallow: true do
    resources :invites do
      post :send_multiple, on: :collection
    end
    resources :game_players
  end
end
