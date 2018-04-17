Rails.application.routes.draw do


  get '/servers/rockwell' => 'servers#rockwell'
  get '/rockwell/servers' => 'rockwell#server'

  post '/bookings' => 'bookings#create'

  post '/bookings' => 'bookings#create'

  root 'landing#index'
  get 'landing/index'

  get "/city/miami" => "club#index"
  get "/city" => "city#city"

  get "/tables" => 'reservationss#table'

  get '/login' => 'users#new'

  post '/users' => 'users#create'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'clubs/:clubname' => "rockwell#index"
  get 'clubs/:clubname/servers' => "servers#rockwell"
  get 'clubs/:clubname/reservations' => "reservations#index", as: 'reservations'
  post '/available_tables_for_date' => "reservations#tables", as: 'reserved_tables_for'
  post 'clubs/:clubname/reservations' => 'reservations#checkout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
