Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'auth/facebook', to: 'authentication#facebook'
  post 'signup', to: 'users#create'
end
