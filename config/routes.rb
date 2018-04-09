Rails.application.routes.draw do

  root "static_pages#home"  # "controller#action"

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  resources :users

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

end