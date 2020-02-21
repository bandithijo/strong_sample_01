Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users
end
