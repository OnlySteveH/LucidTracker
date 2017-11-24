Rails.application.routes.draw do
  

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/faq', to: 'static_pages#faq'
  get  '/co_to', to: 'static_pages#co_to'
  get '/spis', to: 'static_pages#spis'

  get '/strona', to:'static_pages#strona'
  

  resources :users
  resources :static_pages
end
