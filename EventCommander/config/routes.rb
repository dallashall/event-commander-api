Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
    post    "/sign-in"  => "sessions#create"
    delete  "/sign-out" => "sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
