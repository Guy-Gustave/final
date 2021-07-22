Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # post '/users',         to: 'users#create'
  # get '/users/:user_id', to: 'users#show'
  get '/users', to: 'users#index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :projects do
    resources :tasks
  end
end
