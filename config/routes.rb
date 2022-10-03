Rails.application.routes.draw do
  scope :api do
    resources :users, only: [:index, :create, :destroy, :update]
    resources :posts

    post "user/login", to: "users_authentication#create"
  end
end
