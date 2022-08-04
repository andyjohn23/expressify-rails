Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :destroy, :update]
    get '/register', to: "users#create"
    get '/me', to: "users#show"
  end
end
