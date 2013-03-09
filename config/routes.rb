# encoding: utf-8

Loblaw::Engine.routes.draw do
  resources :conversations do
    get 'page/:page' => :index, on: :collection
  end

  controller :home do
    get :about
    get :contact
    get :faq
    get :help
    get :terms
  end

  root to: 'home#index'
end
