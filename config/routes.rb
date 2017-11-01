Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static-pages/about'
  root 'static/home'
  resources :photos, except: [:new]
  get 'photos/index'
end
