Rails.application.routes.draw do
  
  get 'users/new'

  root 'static_pages#landing'
  get 'static_pages/home'
  
  resources :users

  
end
