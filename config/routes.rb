Rails.application.routes.draw do
  #get 'articles/index'
  #get 'articles/new'

  #resources :articles
  devise_for :users

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'
  resources :items, only: [:new, :create, :edit, :update]

end
