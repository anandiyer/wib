Whoisbetter::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources  :authentications
  resources  :votes
  resources  :games
  resources  :teams
  resources  :sports
  resources  :league_types
  resources  :sport_types
  root :to => "home#index"

end
