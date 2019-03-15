# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
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

  root to: 'gardens#index'
end
