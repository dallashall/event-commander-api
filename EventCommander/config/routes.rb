Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
    post    "/sign_in"  => "sessions#create"
    delete  "/sign_out" => "sessions#destroy"
    resources :events
    resources :teams
    resources :team_members
    resources :tasks
    resources :details
    post "/team_members_sessions" => "team_members_sessions#create"
    delete "/team_members_sessions" => "team_members_session#destroy"
  end
  post "/sign-in" => "sessions#make"
  post "/sign-out" => "sessions#unmake"
end
