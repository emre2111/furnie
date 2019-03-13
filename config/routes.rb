Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      get :confirmation
      get :randomize
    end

    resources :products, only: [:index, :show, :new, :create] do
      resources :booking_items, only: [:create]
      resources :random_booking_items, only: [:create]
    end
    resources :payments, only: [:new, :create]
    # resources :randomizer do
    #   member do
    #     get :randomize
    #   end
    # end
  end
end
