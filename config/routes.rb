Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users

  resources :events do
    resources :enrollments, only: [:create, :destroy]
  end
  
  
  # Defines the root path route ("/")
  root "events#index"
end
