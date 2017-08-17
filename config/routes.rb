Rails.application.routes.draw do
  resources :photos, except: [:new]
  root :to => 'photos#index'
end
