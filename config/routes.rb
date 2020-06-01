Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get  '/signup',  to: 'users#new'
end
