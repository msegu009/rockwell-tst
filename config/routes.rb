Rails.application.routes.draw do



  get '/rockwell/servers'

  post '/bookings' => 'bookings#create'

  post '/bookings' => 'bookings#create'

  root 'landing#index'
  get 'landing/index'

  get "/city/miami" => "club#index"
  get "/city" => "city#city"



  get '/login' => 'users#new'

  post '/users' => 'users#create'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'clubs/:clubname' => "rockwell#index"
  get 'clubs/:clubname/servers' => "servers#rockwell"
  get '/clubs/:clubname/reservations' => "reservations#index", as: 'reservations'
  post '/available_tables_for_date' => "reservations#tables", as: 'reserved_tables_for'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
