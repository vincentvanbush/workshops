Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  resources :users, only: [:show]

  root 'categories#index'
end
