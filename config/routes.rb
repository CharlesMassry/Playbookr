Rails.application.routes.draw do
  root "landings#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :players, only: [:new, :create]

  resources :teams, only: [:new, :create, :show] do
    resource :player_invites, only: [:new, :create]

    resources :plays, only: [:new, :create, :show] do
      resources :comments, only: [:create, :destroy]
      resources :media, only: [:new, :create, :show]
    end
  end
end
