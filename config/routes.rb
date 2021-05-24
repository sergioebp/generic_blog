Rails.application.routes.draw do
  resources :rates, only: [:edit, :create, :update, :destroy]
  devise_for :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    post :rate, on: :member

    resources :elements
    resources :comments, only: [:edit, :create, :update, :destroy] do
      post :rate, on: :member
    end
  end

  get 'editor', to: "editor#index"

  root to: "posts#index"
end
