Rails.application.routes.draw do
  root to: "tasks#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  namespace :tasks do
    resources :searches, only: :index
  end
  resources :tasks do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users do
    member do
      get "following"
      get "followers"
    end
  end
  resources :relationships, only: [:create, :destroy]
end