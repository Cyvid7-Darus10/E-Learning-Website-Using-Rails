Rails.application.routes.draw do
  root 'pages#home'
  
  get 'signup',   to: 'users#new'
  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'login',    to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'

  get 'admin/new_category',   to: 'admin/categories#new'
  get 'admin/edit_category',   to: 'admin/categories#edit'

  resources :users
  resources :sessions, only: :create
  resources :categories

  namespace :admin do
    resources :users
    resources :categories
  end
end
