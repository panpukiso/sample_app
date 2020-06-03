Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/home'    => 'static_pages#home'
  get '/about'   => 'static_pages#about'
  get '/help'    => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get    '/login' => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  
  resources :users do
    member do
      get :following, :followers
      # GET /users/1/following
      # GET /users/1/followers
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,    only: [:create, :destroy]
end
