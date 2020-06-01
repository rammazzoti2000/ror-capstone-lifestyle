Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, except: [:new]
  
  get 'sessions/new'
  get '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'articles/new'
  get 'articles/show'
end
