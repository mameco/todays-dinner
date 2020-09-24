Rails.application.routes.draw do
  root "menus#index"
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :keywords
  resources :menus do
    collection do
      get 'search'
    end
  end
end
