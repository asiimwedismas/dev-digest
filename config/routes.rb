Rails.application.routes.draw do
  resources :article_categories
  resources :votes
  resources :categories
  resources :articles
  resources :users, only: %i[new create show]

  get 'login' => 'users#index'
  post 'login' => 'users#authenticate_user'
  get 'logout' => 'users#logout'
  get 'signup' => 'users#new'
  post 'signup' => 'user#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
