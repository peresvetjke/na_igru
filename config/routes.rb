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

  resources :players, shallow: true do
    get :counts, on: :collection
    resources :games, only: :index, on: :collection
  end

  resources :notifications, only: :index do
      get   :unviewed, on: :collection
      patch :mark_all_as_read, on: :collection
  end

  resources :locations do
    resources :games, only: %i[new create index]
    patch :update_inline, on: :member
  end

  resources :invites, shallow: true do
    patch :accept,  to: "invites#accept" # or post?
    patch :decline, to: "invites#decline"
    get :unviewed, on: :collection
  end
  
  resources :games, shallow: true do
    post :join, :leave, :cancel, :pass, on: :member
    resources :invites do
      post :send_multiple, on: :collection
    end
    resources :game_players
  end

  
end
