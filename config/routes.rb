Rails.application.routes.draw do

  devise_for :users
  resources :wikis

  resources :users, only: [:show]


  resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end

  get "downgrade", to: "charges#downgrade"
  root 'welcome#index'

end
