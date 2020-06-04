Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, except: [:show, :edit]
  resources :categories, only: [:index, :create, :destroy]
  resources :comments, only: [:new, :create]
  resources :votes, only: [:index, :create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  resources :tags
  resources :articles

  get 'sessions/new'
  get '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'published_articles', to: 'articles#published_articles'
  get 'saved_articles', to: 'articles#saved_articles'
  get 'bookmarks', to: 'articles#bookmarks'
  get 'search', to: 'articles#search'
  get 'create_category', to: 'categories#new'

  get 'profile', to: 'users#show'
  get '/edit_profile', to: 'users#edit'
end
