Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/FAQ', to: 'static_pages#FAQ'
  get  '/Co_to', to: 'static_pages#Co_to'
  

  resources :users
  resources :static_pages
end
