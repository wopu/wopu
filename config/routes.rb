Wopu::Application.routes.draw do

  resources :categories

  resources :available_tags

  resources :tags

  resources :helps

  resources :users

  resources :sessions
  delete 'sessions', to: 'sessions#destroy'

  resources :foundations do
    resources :needs do
      post 'mark_solved' => 'needs#mark_solved'
    end
  end

  get 'admin' => 'admin#index'
  get 'try_now' => 'home#try_now'
  root 'home#index'
end
