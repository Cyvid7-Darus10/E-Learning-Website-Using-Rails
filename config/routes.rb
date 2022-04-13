Rails.application.routes.draw do
  root 'pages#home'
  
  get 'signup',   to: 'users#new'
  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'login',    to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create
end
