Wopu::Application.routes.draw do

  resources :available_tags

  resources :needs

  resources :tags

  resources :helps

  resources :users

  resources :sessions
  delete 'sessions', to: 'sessions#destroy'

  resources :foundations

  get 'admin' => 'admin#index'
  root 'home#index'
end
