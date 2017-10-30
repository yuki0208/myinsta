Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :photos, except: [:new]
  root :to => 'photos#index'
end
