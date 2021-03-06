Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/reply_booking', to: 'bookings#reply_rent'
  get '/renter_bookings', to: 'bookings#renter_bookings'

  resources :cats do
    resources :bookings, only: %i[new create]
  end
  get '/my_cats', to: 'cats#users_cats'
  resources :cats
end
