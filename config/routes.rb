Loblaw::Engine.routes.draw do
  resources :conversations
  root to: 'conversations#index'
end
