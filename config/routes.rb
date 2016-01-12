Rails.application.routes.draw do
  root 'pages#start'

  resources :flights
  resources :planes
  resources :users
  resources :reservations

end
