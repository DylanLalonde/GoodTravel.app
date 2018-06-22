Rails.application.routes.draw do

  mount ForestLiana::Engine => '/forest'
  devise_for :users, controllers: {registrations: "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:index, :show, :new, :create] do
    resources :bookings,  only: [:show, :new, :create, :destroy ] do
     resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
     end
    end
  end

  resources :experiences, only: [ :index, :show ] do
    resources :review, only: [:create]
  end

  resources :ngos, only: [:index]

 

end
