RoboLove::Application.routes.draw do

  resources :user_messages
  get "/user_messages/:id/new/" => "user_messages#new", :as => :new_user_message

  get "friends/my_new/:user2" => "friends#my_new", :as => :my_new_friend
  get "messages/display_messages" => "messages#display_messages", :as=>:display_messages
  get "messages/new/:user_id/:relation_id" => "messages#new"
  resources :messages

  get "login" => "users#login", :as => :login
  resources :relations
  resources :friends

  resources :users
  get "sessions/new" => "sessions#new", :as=>:sign_in
  get "sessions/destroy" => 'sessions#destroy', :as => :sign_out
  post "sessions/create" => "sessions#create"
  root to: "users#login"

end
