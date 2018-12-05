Rails.application.routes.draw do

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
get '/auth/facebook/callback' => 'sessions#create'

resources :sessions
resources :users 


root to: "categories#index"

resources :categories do 
  resources :toys 
  end 
end

