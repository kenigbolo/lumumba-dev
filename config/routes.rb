Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations', confirmations: "confirmations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :designs do
    member do
      put "like", to: "designs#upvote"
    end
  end
  resources :products do
    resources :order_items, only: [:create, :destroy]
  end
  resources :articles
  resources :addresses
  resources :orders, only: [:index, :show]


  root to: "home#index"
  get 'users/:id', to: 'users#show', as: :user
  get 'user/designs/', to: 'users#design', as: :user_designs
  get 'user/shipping-address/', to: 'users#address', as: :user_address
  get '/address/subregion_options', to: 'addresses#subregion_options'
  get '/competition', to: 'designs#competition'

  get '/users', to: 'users#index', as: :users_default
  get '/themes', to: 'home#themes'
  get '/leaderboard', to: 'home#leaderboard'

  post '/checkout', to: 'orders#checkout', as: :checkout
  post 'orders/shipping/:id', to: 'orders#shipping', as: :shipping
  get 'orders/payment/:id', to: 'orders#payment', as: :payment

  get '/designs-show', to: 'designs#show'


end
