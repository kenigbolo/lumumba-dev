Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations', confirmations: "confirmations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :designs
  resources :articles
  resources :addresses
  root to: "home#index"
  get 'users/:id', to: 'users#show', as: :user
  get 'user/designs/', to: 'users#design', as: :user_designs
end
