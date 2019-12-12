Rails.application.routes.draw do
  namespace :api do
    post "/login", to: "sessions#create"
    post "/get_user_info", to: "sessions#show"
    resources :categories
    resources :users
    resources :products

    namespace :admin do
      get "/dashboard", to: "base_admin#dashboard"
    end
  end
end
