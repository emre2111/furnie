Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show, :new, :create, :edit, :update] do
    resources :products, only: [:index, :show, :new, :create] do
      resources :booking_items, only: [:create]
    end
    resources :payments, only: [:new, :create]
  end
end
