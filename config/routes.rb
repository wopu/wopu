Wopu::Application.routes.draw do

  resources :needs

  resources :helps

  resources :users

  resources :foundations

  root 'home#index'
end
