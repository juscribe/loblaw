Rails.application.routes.draw do

  mount Loblaw::Engine => '/loblaw', as: 'loblaw'
end
