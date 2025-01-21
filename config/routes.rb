Rails.application.routes.draw do
  get 'uploader/image'
  devise_for :users
  resources :sections
  resources :reviews
  resources :contacts
  resources :categories
  resources :policies
  resources :coachings, path: 'coaching'
  root 'home#index'

  namespace :admin do
    root to: 'dashboard#index'
    
    resources :blogs
    resources :resources
    resources :sections
    resources :users
    resources :reviews
    resources :categories
    resources :policies
    resources :coaching
  end

  resources :reorder do
    patch :move
  end
  
  post 'reorder/update_sections_order', to: 'reorder#update_sections_order'

  post 'uploader/image' => 'uploader#image'

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  get 'errors/not_found'
  get 'errors/internal_server_error'

  get '/contact_us', to: 'contact_us#new'
  post '/contact_us', to: 'contact_us#create'
  get 'contact_us/sent'
  get 'contact_us/error'

  resources :blogs, path: :blog, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get ':title', action: :show, as: 'with_title'
    end
  end

  resources :resources, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get ':title', action: :show, as: 'with_title'
    end
  end

  require 'active_storage/engine'
  ActiveStorage::Engine.routes.draw do
    get '/rails/active_storage/blobs/redirect/:signed_id/*filename' => 'active_storage/blobs#show', as: :rails_service_blob
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # test for deployment

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
