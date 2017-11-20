Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get  'static_pages/FAQ'
  get  'static_pages/Co_to'
  post '/signup', to: 'users#create'
  

  resources :users
end
