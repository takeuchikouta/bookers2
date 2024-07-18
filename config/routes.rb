Rails.application.routes.draw do
  # get 'homes/top'

  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :index, :update]
  get "home/about"=>"homes#about"
end
