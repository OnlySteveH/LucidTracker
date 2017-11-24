Rails.application.routes.draw do
  
  root   'static_pages#strona'
  
  get  '/faq', to: 'static_pages#faq'
  get  '/co_to', to: 'static_pages#co_to'
  get '/spis', to: 'static_pages#spis'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
