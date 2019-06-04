Rails.application.routes.draw do
  root to: 'pages#home'
  # root to: 'watches#show'
  devise_for :users

# AS RENTER
  resources :watches, only: [:index, :show, :destroy] do
    member do
      post :compare, defaults: { format: :js }
    end
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
