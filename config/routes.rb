Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :game_sessions
end
