require 'sidekiq/web'

Rails.application.routes.draw do
  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resource :registration, only: [:new, :create]
  resources :users, only: :show

  namespace :admin do
  end

  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'
end
