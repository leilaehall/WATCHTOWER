Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  root to: 'pages#home'
  devise_for :users
# AS RENTER
  resources :watches, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
# AS BOTH
  resources :bookings, only: [:index] do
    # AS OWNER
    member do
      patch :accept
      patch :decline
    end
  end
# AS OWNER
  resources :my_watches, only: [:index, :create, :new]
end
