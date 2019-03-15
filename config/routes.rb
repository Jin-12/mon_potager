Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :avatars, only: [:create, :destroy]
    resources :statuses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gardens do
    resources :images, only: [:create, :destroy]
  end
  resources :products
  resources :favorites
  resources :status
  resources :searches
  root :to => "gardens#index"
end
