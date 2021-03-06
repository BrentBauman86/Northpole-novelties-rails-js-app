Rails.application.routes.draw do
  
root 'welcome#home'

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
post '/sessions/create', to: "sessions#create"
get 'logout', to: 'sessions#destroy', as: 'logout'
get '/auth/facebook/callback', to: 'sessions#create'

resources :users  
   
get 'toys', to: 'toys#index'

resources :categories do 
  resources :toys do 
    get 'popular', :on => :collection
    end  
  end
end 





