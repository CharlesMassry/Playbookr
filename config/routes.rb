Rails.application.routes.draw do
  root "landings#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  resources :players, only: [:new, :create]
  resource :preferences, only: [:show]

  resources :teams, only: [:new, :create, :show] do
    resource :player_invites, only: [:new, :create]

    resources :plays, only: [:new, :create, :show] do
      resources :comments, only: [:create]
      resources :media, only: [:new, :create, :show]
    end
  end
end
