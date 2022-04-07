Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "uploads#index"
  devise_for :users
  resources :uploads, only: [:index, :new, :create, :destroy]

  get '/tl/:short_url', to: 'tiny_links#show', as: 'tiny_link'
end
