Rails.application.routes.draw do
  
  resources :orders

  get 'sessions/new'
  get 'events/new'
  get 'users/new'
  
  #get '/events/:id' => 'events#current'
  post 'current_event' => 'events#current'
  
  root   'static_pages#landing'
  get    'home' => 'static_pages#home'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'
  delete 'logout'  => 'sessions#destroy'
  
  
  resources :users
  
  resources :events, only: [:create, :destroy]

  
end
