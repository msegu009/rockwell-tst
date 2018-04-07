Rails.application.routes.draw do
  get 'reservation/index'

  root 'landing#index'
  get 'landing/index'

  get "/city/miami" => "club#index"
  get "/city" => "city#city"
  get "/signup" => "signup#signup"
  # post "/signup" => "signup#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
