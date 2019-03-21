# frozen_string_literal: true

Rails.application.routes.draw do
  concern :commentable do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  concern :image_attachable do
    resources :images, only: %i[create destroy]
  end

  root to: 'gardens#index'
  devise_for :users, controllers: {registrations: "registrations"}
  resources :users do
    resources :avatars, only: %i[create destroy]
    resources :statuses
  end

  resources "contacts", only: [:new, :create]

  resources :gardens, concerns: [:commentable, :image_attachable]
  resources :favorites, only: [:create]

  match "contactmail", to: "gardens#contactmail", via: :post
  
  get "/static/landing", to: "static#landing"
  get "/static/landing_map", to: "static#landing_map"
  get "/static", to: "static#landing"
  get "/static/about_us", to: "static#about_us"


end
