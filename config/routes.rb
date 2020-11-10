Rails.application.routes.draw do
  resources :users, only: [:create] do
  end
  post '/logout', to: 'users#log_out'
  post '/login', to: 'users#login'

  resources :practices, only: [:index]


  get '/auto_login', to: 'users#auto_login'
end
