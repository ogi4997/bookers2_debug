Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	member do
  		get :following, :followers
  	end
  end

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
end