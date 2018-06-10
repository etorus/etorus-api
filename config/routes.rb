Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'auth/facebook', to: 'authentication#facebook'
  post 'signup', to: 'users#create'

  resources :meditations do
    member do
      get :enter
      get :leave
    end
  end

  resources :users, only: [:create, :update] do
    collection do
      get :profile
    end
  end
end
