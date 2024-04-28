Rails.application.routes.draw do
  devise_for :users
  resources :flats
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :flights do
    resources :airline_tickets
  end

  get "my_airline_tickets", to: "airline_tickets#my_flights"
  # Defines the root path route ("/")
  # root "articles#index"
end
