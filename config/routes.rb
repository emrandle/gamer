Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users
  resources :users
  resources :game_sessions
  resources :game_groups

  get 'game/search_for_game', action: 'search_for_game', controller: 'game'
end
