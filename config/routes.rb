Rails.application.routes.draw do
 

  
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
  get '/clubs/:clubname/reservations' => "reservations#index", as: 'reservations'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
