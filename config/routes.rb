Wopu::Application.routes.draw do

  resources :users

  resources :foundations

  root 'home#index'
end
