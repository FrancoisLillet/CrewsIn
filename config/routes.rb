Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[show update] do
    resources :mates, only: %i[index new create edit update show]
    get "/nautical_cv", to: "users#nautical_cv", as: "nautical_cv"
    resources :experiences, only: %i[create update destroy]
    resources :trips, only: %i[index new create edit update destroy] do
      resources :enrollments, only: %i[new create]
      resources :invitations, only: %i[create update]
    end
    resources :invitations, only: %i[index]
  end
  resources :mates, only: %i[destroy]
  resources :trips, only: %i[show]
  resources :enrollments, only: %i[destroy]
end
