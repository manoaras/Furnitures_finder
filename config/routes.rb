Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "/dashboard", to: "dashboards#index"

  resources :furnitures do
    resources :bookings, only: :create do
      resources :payments, only: :new
    end
  end

  resources :bookings, only: :show

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
