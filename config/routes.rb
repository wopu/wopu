Wopu::Application.routes.draw do

  resources :foundations

  root 'home#index'
end
