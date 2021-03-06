Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root to: 'pages#home'

  get '/businesses', to: 'categories#show'

  resources :categories, only: [:index]
  resources :businesses, only: [:index]

  resources :categories, only: [:show] do
    resources :businesses, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'businesses'
    end
  end

  resources :businesses do
    member do
      get 'book'
    end
  end
end
