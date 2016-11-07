Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users
  resources :users
  resources :visitors
  match 'sign_in',      to: 'visitors#new',           via: 'post'
  match 'demo',    to:'visitors#demo'   , via:'get'
  post 'visitors/create'
  resources :employees
  resources  :registrations do
    match 'new',      to: 'registrations#new',           via: 'get'
    match 'new',      to: 'registrations#create',        via: 'post'

  end
  #root 'employees#new'

    devise_scope :user do
      get "signup", to: "devise/registrations#new"
      get "signin", to: "devise/sessions#new"
      get "logout", to: "devise/sessions#destroy"
    end
  resources :projects do
    match 'new',      to: 'projects#new',           via: 'get'
    match 'new',      to: 'projects#create',        via: 'post'

  end

  resources :tasks
  end



