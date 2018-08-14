Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :projects, only: [:create,:update,:show]
      resources :users, only: [:index, :create, :show]

      post "/auth", to: "auth#login"
      get "/current_user", to: "auth#get_current_user"

      post "/user/projects", to: "projects#index"

    end
  end

end
