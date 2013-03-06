# encoding: utf-8

Loblaw::Engine.routes.draw do
  resources :conversations

  controller :home do
    get 'about'   => :about,    as: :about
    get 'contact' => :contact,  as: :contact
    get 'faq'     => :faq,      as: :faq
    get 'help'    => :help,     as: :help
    get 'terms'   => :terms,    as: :terms
  end

  root to: 'home#index'
end
