Rails.application.routes.draw do
  get 'areas/show'
  resources :caves
  get 'sessions/new'
  root 'home#top'
  resource :user, only: [:new, :create, :show]
  resources :users, only: [:edit, :update]
  patch 'user', to: "users#update"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
