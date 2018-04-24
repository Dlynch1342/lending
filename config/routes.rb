Rails.application.routes.draw do
  get 'lenders/new'
  root 'lenders#index'
  resources :lenders
  resources :sessions, only: [:new, :create, :destroy]
  resources :borrowers

  get 'lenders/destroy'

  get 'sessions/new'

  get 'sessions/create'
end
