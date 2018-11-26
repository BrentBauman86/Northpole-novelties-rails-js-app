Rails.application.routes.draw do
  
resources :sessions
resources :users 

root to: "toys#index"
resources :toys 
end

