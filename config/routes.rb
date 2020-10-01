Rails.application.routes.draw do
  root 'categories#index'

  resources :article_categories
  resources :users, only: %i[new create show]

  resources :categories

  resources :articles, only: %i[new create show] do
    resources :votes, only: %i[create destroy]
  end

  get 'login' => 'users#index'
  post 'login' => 'users#authenticate_user'
  get 'logout' => 'users#logout'
  get 'signup' => 'users#new'
  post 'signup' => 'user#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
