Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/home'    => 'static_pages#home'
  get '/about'   => 'static_pages#about'
  get '/help'    => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get    '/login' => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
end
