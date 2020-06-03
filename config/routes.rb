Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :categories
  resources :comments
  resources :votes, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  resources :tags
  resources :articles do
    post :increment
  end

  get 'sessions/new'
  get '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'published_articles', to: 'articles#published_articles'
  get 'saved_articles', to: 'articles#saved_articles'
  get 'bookmarks', to: 'articles#bookmarks'
  get 'search', to: 'articles#search'
end
