Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :participants
  devise_for :sponsors
  namespace :dashboard do
    root to: 'dashboard#index'
  end
end
