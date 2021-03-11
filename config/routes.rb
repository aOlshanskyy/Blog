Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts
  resources :comments, only: [:create, :destroy]

  get "/categories/:id", to: "posts#categories", as: "categories"
  get "/authors/:id", to: "posts#authors", as: "authors"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
