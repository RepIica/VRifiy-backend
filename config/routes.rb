Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :projects
      resources :users, only: [:index, :create, :show]

      post "/auth", to: "auth#login" # login
      get "/current_user", to: "auth#get_current_user" # ???

    end
  end

end
