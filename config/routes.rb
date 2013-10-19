Wopu::Application.routes.draw do

  resources :helps

  resources :users

  resources :foundations

  root 'home#index'
end
