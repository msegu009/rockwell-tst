Rails.application.routes.draw do

  # get 'sessions/create'


  get 'reservation/index'

  root 'landing#index'
  get 'landing/index'

  get "/city/miami" => "club#index"
  get "/city" => "city#city"



  get '/login' => 'users#new'

  post '/users' => 'users#create'
  
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
