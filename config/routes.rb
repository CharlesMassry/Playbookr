Rails.application.routes.draw do
  root "landings#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :teams, only: [:new, :create, :show] do
    resources :plays, only: [:new, :create, :show] do
      resources :play_comments, only: [:create]
      resources :medium_comments, only: [:create]
      resources :comment_comments, only: [:create]
      resources :media, only: [:new, :create, :show]
    end
  end
end
