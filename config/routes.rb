Rails.application.routes.draw do
  root 'pages#home'
  get 'signup',   to: 'users#new'
  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
