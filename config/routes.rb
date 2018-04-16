Rails.application.routes.draw do

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  root "static_pages#home"  # "controller#action"

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  resources :users

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  resources :account_activations, only: [:edit]

end