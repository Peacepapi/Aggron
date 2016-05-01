Rails.application.routes.draw do

  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  root 'pages#home'

  namespace :api do
    resources :tools
  end


  resources :tools do
  	resources :comments
    post '/borrow_request', to: 'borrow_requests#createRequest'
  end
 
  resources :tooltypes, only: [:show]

  resources :users, except: [:new] do
    post '/borrow_request/reject/:id', to: 'borrow_requests#rejectTool', as: 'reject'
    post '/borrow_request/lend/:id', to: 'borrow_requests#lendTool', as: 'lend'
    post '/return_request/:tool_id', to: 'borrow_requests#requestReturn', as: 'requestReturn'
    post '/return_tool/:tool_id', to: 'borrow_requests#acceptReturn', as: 'return'
  end

  resources :conversations, only: [:create, :index] do
    resources :messages
  end


  get '/signup', to: 'users#new'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'

end
