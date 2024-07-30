Rails.application.routes.draw do
  resources :blogs
  resources :reviews, only: [:new, :create, :edit, :update]
  resources :stories, only: [:new, :create, :edit, :update]
  resources :services, only: [:new, :create, :edit, :update]
  resources :abouts, only: [:new, :create, :edit, :update]
  resources :intros, only: [:new, :create, :edit, :update]
  resources :contacts
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
