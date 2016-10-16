Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'users/:id', to: 'users#show', as: :user
end
