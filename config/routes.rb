Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :participants
  devise_for :sponsors
end
