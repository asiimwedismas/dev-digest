Rails.application.routes.draw do
  root 'categories#index'

  resources :users, only: %i[new create show]

  resources :categories, only: %i[index show new create]

  resources :articles, only: %i[new edit update create show] do
    resources :votes, only: %i[create destroy]
  end

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#authenticate_user'
  get 'logout' => 'sessions#logout'
  get 'signup' => 'users#new'
  post 'signup' => 'user#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
