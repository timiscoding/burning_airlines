Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  root 'pages#start'

  resources :flights
  resources :planes
  resources :users
  resources :reservations

end
