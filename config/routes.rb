Rails.application.routes.draw do

  devise_for :users
  resources :wikis

  resources :users, only: [:show]
  resources :collaborators, only: [:create, :destroy]

  resources :charges, only: [:new, :create]
  get "downgrade", to: "charges#downgrade"
  root 'welcome#index'

end
