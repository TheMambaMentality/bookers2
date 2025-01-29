Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: "homes#top"
  resources :books
  resources :users

  get 'home/about', to: "homes#about", as: "about"

end
