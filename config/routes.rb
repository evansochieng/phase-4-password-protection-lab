Rails.application.routes.draw do
  # User's routes
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

  # Sessions routes
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
