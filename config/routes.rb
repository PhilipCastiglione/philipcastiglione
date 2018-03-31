Rails.application.routes.draw do
  get 'counter', to: 'counter#index'
  post 'counter', to: 'counter#increment'

  root 'static#index'
end
