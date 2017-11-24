Rails.application.routes.draw do

  

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
<<<<<<< HEAD
  get  '/faq', to: 'static_pages#faq'
  get  '/co_to', to: 'static_pages#co_to'
  get '/spis', to: 'static_pages#spis'

  get '/strona', to:'static_pages#strona'
  

=======
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
>>>>>>> master

  resources :users
end
