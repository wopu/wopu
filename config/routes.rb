Wopu::Application.routes.draw do

  resources :available_tags

  resources :tags

  resources :helps

  resources :users

  resources :sessions
  delete 'sessions', to: 'sessions#destroy'

  resources :foundations do
    resources :needs
  end

  get 'admin' => 'admin#index'
  root 'home#index'
end
