Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy, :index]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
