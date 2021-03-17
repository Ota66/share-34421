Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
