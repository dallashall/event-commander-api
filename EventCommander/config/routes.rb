Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
    post    "/sign-in"  => "sessions#create"
    delete  "/sign-out" => "sessions#destroy"
    resources :events
    resources :teams
    resources :team_members
    resources :tasks
    resources :details
  end
  resources :users
  post "/sign-in" => "sessions#make"
  post "/sign-out" => "sessions#unmake"
end
