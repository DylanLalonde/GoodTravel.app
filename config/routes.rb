Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:index, :show, :new, :create] do
    resources :bookings,  only: [:show, :new, :create, :destroy ]
  end

  resources :experiences, only: [ :index, :show ] do
    resources :review, only: [:create]
  end

  resources :ngos, only: [:index]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
