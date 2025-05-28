Rails.application.routes.draw do
  resources :gardens, only: [:show] do
    resources :plants, only: [:create]
  end
  resources :plants, only: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check


end
