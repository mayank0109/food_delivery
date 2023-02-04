Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/orders/frequency', to: 'orders/frequency#index'
  get '/repeat_customers', to: 'repeat_customers#index'
end
