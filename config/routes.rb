Rails.application.routes.draw do
  resources :users, only: [:create] do
  end
  post '/logout', to: 'users#log_out'
  post '/login', to: 'users#login'

  resources :practices, only: [:index, :create]
  resources :skills, only: [:index]
  resources :skill_categories, only: [:index]
  resources :check_ins, only: [:create]

  # get '/auto_login', to: 'users#auto_login'
end
