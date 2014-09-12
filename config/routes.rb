require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboards
  end

  root "landings#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  resources :players, only: [:new, :create]
  resource :preferences, only: [:show]

  resources :teams, only: [:new, :create, :show] do
    resource :player_stats, only: [:show]
    resource :player_invites, only: [:new, :create]

    resources :plays, only: [:new, :create, :show] do
      resources :comments, only: [:create, :destroy]
      resources :media, only: [:new, :create, :show, :destroy]
    end
  end
end
