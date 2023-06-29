Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as:'about'
  resources :users, only: [:show, :edit, :index, :update, :new, :create]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy ] do 
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
