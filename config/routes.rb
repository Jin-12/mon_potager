# frozen_string_literal: true

Rails.application.routes.draw do
  # concern :commentable do
  #   resources :comments
  # end

  root to: 'gardens#index'
  devise_for :users
  resources :users do
    resources :avatars, only: %i[create destroy]
    resources :statuses
  end
  resources :gardens do
    resources :images, only: %i[create destroy]
    resources :comments
  end
  resources :favorites, only: [:create]
  resources :comments

  get "/static/landing", to: "static#landing"
  get "/static/landing_map", to: "static#landing_map"
  get "/static", to: "static#landing"
end
