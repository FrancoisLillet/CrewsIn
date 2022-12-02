Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[show update] do
    resources :mates, only: %i[index new create edit update]
    resources :trips, only: [:index]
  end
  resources :mates, only: %i[show destroy]
end
