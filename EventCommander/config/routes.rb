Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
    post    "/sign_in"  => "sessions#create"
    delete  "/sign_out" => "sessions#destroy"
    resources :events
    resources :teams
    resources :team_members
    get "/team_members/connect/:sut" => "team_members#connect"
    resources :tasks
    resources :details
    resources :detail_assignments
    get "/events/:id/teams" => "events#teams"
    post "/team_members_sessions" => "team_members_sessions#create"
    delete "/team_members_sessions" => "team_members_session#destroy"
  end
  post "/sign-in" => "sessions#make"
  post "/sign-out" => "sessions#unmake"
end
