Rails.application.routes.draw do
  get 'uploader/image'
  devise_for :users
  resources :sections
  resources :blogs,  path: :blog
  resources :reviews
  resources :contacts
  resources :categories, only: [:create]
  root 'home#index'

  post 'uploader/image' => 'uploader#image'

  require 'active_storage/engine'
  ActiveStorage::Engine.routes.draw do
    get '/rails/active_storage/blobs/redirect/:signed_id/*filename' => 'active_storage/blobs#show', as: :rails_service_blob
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
