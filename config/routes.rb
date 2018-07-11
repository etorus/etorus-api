Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'auth/facebook', to: 'authentication#facebook'
  post 'signup', to: 'users#create'

  resources :notifications, only: [:create, :index]

  resources :meditations do
    member do
      get :enter
      get :leave
    end

    collection do
      get :my
    end
  end

  resources :users, only: [:create, :update] do
    collection do
      get :profile
    end
  end

  resources :passwords, only: [] do
    collection do
      post :reset
    end
  end


  namespace :pages do
    resource :passwords, only: [] do
      put :update
      get :recovery
    end
  end
end
