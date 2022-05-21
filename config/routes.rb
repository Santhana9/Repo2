Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/signin', to: "sessions#create"
  #get '/', to: "https://www.google.com" 
  resources :users
end
