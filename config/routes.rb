Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :participants
  devise_for :sponsors
  namespace :dashboard do
    authenticated :participant do
        resources :subjects, module: "participant", only: [:index]
    end

    authenticated :sponsor do
        resources :subjects, module: "sponsor"
    end

    root to: 'dashboard#index'
  end
end
