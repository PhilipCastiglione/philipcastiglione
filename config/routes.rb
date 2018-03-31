Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  get 'counter', to: 'counter#index'
  post 'counter', to: 'counter#increment'

  root 'static#index'
end
