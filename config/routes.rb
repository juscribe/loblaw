# encoding: utf-8

Loblaw::Engine.routes.draw do
  resources :conversations do
    get 'page(/:page)', action: :index, page: 1, on: :collection, defaults: { page: 1 }
  end

  controller :home do
    get 'about'   => :about,    as: :about
    get 'contact' => :contact,  as: :contact
    get 'faq'     => :faq,      as: :faq
    get 'help'    => :help,     as: :help
    get 'terms'   => :terms,    as: :terms
  end

  root to: 'home#index'
end
