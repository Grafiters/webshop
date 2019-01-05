Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'items#index'
  get '/login' => 'users#index'
  get '/register' => 'registers#index'
  get '/add-items' => 'items#new'
  get '/item' => 'items#show'

  post '/users' => 'users#create'
  post '/regis' => 'registers#create'
  post '/session' => 'sessions#create'
  post '/add-items' => 'items#create'

end