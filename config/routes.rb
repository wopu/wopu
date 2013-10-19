Wopu::Application.routes.draw do

  resources :available_tags

  resources :needs

  resources :tags

  resources :helps

  resources :users

  resources :foundations

  root 'home#index'
end
