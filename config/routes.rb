Rails.application.routes.draw do
  get  '/faq', to: 'static_pages#faq'
  get  '/co_to', to: 'static_pages#co_to'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
end
