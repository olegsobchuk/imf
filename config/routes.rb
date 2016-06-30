require 'sidekiq/web'

Rails.application.routes.draw do
  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resource :registration, only: [:new, :create]
  resources :users, only: :show
  resources :notifications, only: [:index, :show, :create]

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:index, :show]
  end

  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'
end
