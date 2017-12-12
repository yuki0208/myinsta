Rails.application.routes.draw do

  root 'static_pages#home'
  get '/home' => 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  resource :contact, only: [:new, :create] do
    post :confirm
  end
  get '/contact' => 'contacts#new'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :photoposts do
  end

  post   '/like/:photopost_id' => 'likes#like',   as: 'like'
  delete '/like/:photopost_id' => 'likes#unlike', as: 'unlike'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
