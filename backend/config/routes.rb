
Rails.application.routes.draw do
  get "/id", to: "ids#get_id"
  get "/user",  to: "users#get_user" # Maps to the `show` action in the UsersController
  post "/user", to: "users#create_user"
  get '/tone', to: 'tones#show'
end
