Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'items#index'
  get '/login' => 'users#index'
  get '/register' => 'registers#index'  

  post '/users' => 'users#create'
  post '/regis' => 'registers#create'
  post '/session' => 'sessions#create'
  
end