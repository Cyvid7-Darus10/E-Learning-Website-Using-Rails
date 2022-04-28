Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'pages#home'
  
  get 'signup',   to: 'users#new'
  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'login',    to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create
  resources :categories
  resources :lessons do
    resources :answers
  end

  namespace :admin do
    resources :users
    resources :categories do
      resources :words
    end
  end
end
