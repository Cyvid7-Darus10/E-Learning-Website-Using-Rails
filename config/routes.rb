Rails.application.routes.draw do
  root 'pages#home'
  
  get 'signup',   to: 'users#new'
  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'dashboard',to: 'pages#dashboard'
  get 'login',    to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create
  resources :categories
  resources :lessons do
    resources :answers
  end
  resources :relationships, only: [:create, :destroy]
  
  namespace :admin do
    resources :users
    resources :categories do
      resources :words
    end
  end
end
