# == Route Map
#
#           Prefix Verb   URI Pattern                      Controller#Action
#            seats GET    /seats(.:format)                 seats#index
#                  POST   /seats(.:format)                 seats#create
#         new_seat GET    /seats/new(.:format)             seats#new
#        edit_seat GET    /seats/:id/edit(.:format)        seats#edit
#             seat GET    /seats/:id(.:format)             seats#show
#                  PATCH  /seats/:id(.:format)             seats#update
#                  PUT    /seats/:id(.:format)             seats#update
#                  DELETE /seats/:id(.:format)             seats#destroy
#            login GET    /login(.:format)                 sessions#new
#                  POST   /login(.:format)                 sessions#create
#                  DELETE /login(.:format)                 sessions#destroy
#             root GET    /                                pages#start
#           select GET    /select(.:format)                pages#select
#          seating GET    /seating(.:format)               pages#seating
#          flights GET    /flights(.:format)               flights#index
#                  POST   /flights(.:format)               flights#create
#       new_flight GET    /flights/new(.:format)           flights#new
#      edit_flight GET    /flights/:id/edit(.:format)      flights#edit
#           flight GET    /flights/:id(.:format)           flights#show
#                  PATCH  /flights/:id(.:format)           flights#update
#                  PUT    /flights/:id(.:format)           flights#update
#                  DELETE /flights/:id(.:format)           flights#destroy
#           planes GET    /planes(.:format)                planes#index
#                  POST   /planes(.:format)                planes#create
#        new_plane GET    /planes/new(.:format)            planes#new
#       edit_plane GET    /planes/:id/edit(.:format)       planes#edit
#            plane GET    /planes/:id(.:format)            planes#show
#                  PATCH  /planes/:id(.:format)            planes#update
#                  PUT    /planes/:id(.:format)            planes#update
#                  DELETE /planes/:id(.:format)            planes#destroy
#            users GET    /users(.:format)                 users#index
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#        edit_user GET    /users/:id/edit(.:format)        users#edit
#             user GET    /users/:id(.:format)             users#show
#                  PATCH  /users/:id(.:format)             users#update
#                  PUT    /users/:id(.:format)             users#update
#                  DELETE /users/:id(.:format)             users#destroy
#     reservations GET    /reservations(.:format)          reservations#index
#                  POST   /reservations(.:format)          reservations#create
#  new_reservation GET    /reservations/new(.:format)      reservations#new
# edit_reservation GET    /reservations/:id/edit(.:format) reservations#edit
#      reservation GET    /reservations/:id(.:format)      reservations#show
#                  PATCH  /reservations/:id(.:format)      reservations#update
#                  PUT    /reservations/:id(.:format)      reservations#update
#                  DELETE /reservations/:id(.:format)      reservations#destroy
#

Rails.application.routes.draw do
  resources :seats
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  root 'pages#start'

   get '/select' => 'pages#select'
   get '/seating' => 'pages#seating'

  resources :flights
  resources :planes
  resources :users
  resources :reservations

end

