Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root   'static_pages#landing'
  get   'home' => 'static_pages#home'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get   'logout'  => 'sessions#destroy'
  delete 'logout'  => 'sessions#destroy'
  
  
  resources :users
  
  resources :events, only: [:create, :destroy]

  
end
