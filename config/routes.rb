Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
