Rails.application.routes.draw do
  resources :photos, only: [:index, :create, :destroy]

  root to: 'photos#index'
end
