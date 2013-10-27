Wopu::Application.routes.draw do

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  resources :results

  resources :categories

  resources :available_tags

  resources :tags

  resources :helps do
    post 'accept' => 'helps#accept'
    post 'reject' => 'helps#reject'
  end

  resources :users

  resources :foundations do
    resources :needs do
      post 'mark_solved' => 'needs#mark_solved'
    end
  end

  get 'admin' => 'admin#index'
  get 'try_now' => 'home#try_now'
  get 'about' => 'home#about'

  root 'home#index'
end
