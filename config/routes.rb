Rails.application.routes.draw do
  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resource :registration, only: [:new, :create]
  resources :users, only: :show

  namespace :admin do
  end
end
