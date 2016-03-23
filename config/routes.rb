Rails.application.routes.draw do

  root 'pages#home'

  resources :tools do
  	resources :comments
  end
  
  resources :tooltypes, only: [:show]

  resources :users, except: [:new]
  get '/signup', to: 'users#new'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'

end
