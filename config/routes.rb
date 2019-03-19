# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: "registrations"}
  resources :users do
    resources :avatars, only: %i[create destroy]
    resources :statuses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gardens do
    resources :images, only: %i[create destroy]
    resources :comments
  end
  resources :products
  resources :favorites
  resources :comments
  
  resources "contacts", only: [:new, :create]
  
  root to: 'gardens#index'

  get "/static/landing", to: "static#landing"
  get "/static/landing_map", to: "static#landing_map"
  get "/static", to: "static#landing"
end
