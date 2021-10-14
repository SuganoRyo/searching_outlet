Rails.application.routes.draw do
  get 'areas/show'
  resources :caves do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  get 'sessions/new'
  root 'home#top'
  resource :user, only: [:new, :create, :show] do
    collection do
      get :likes
    end
  end
  resources :users, only: [:edit, :update]
  patch 'user', to: "users#update"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  post 'guest_login', to: "guest_sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
