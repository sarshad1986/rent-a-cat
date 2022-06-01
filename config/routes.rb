Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/accept_booking', to: 'bookings#approve_rent', as: :approve
  get '/renter_bookings', to: 'bookings#renter_bookings'
  # put '/renter_bookings/', to: 'bookings#approve_rent'

  resources :cats do
    resources :bookings, only: %i[new create]
  end
  get '/cats/my_cats', to: 'cats#users_cats'
  resources :cats
end
