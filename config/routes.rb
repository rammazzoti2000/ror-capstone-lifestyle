Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, except: [:new]
  resources :articles
  resources :categories

  get 'sessions/new'
  get '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
