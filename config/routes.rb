Rails.application.routes.draw do
  
  root 'static_pages#landing'
  get 'static_pages/home'

  
end
