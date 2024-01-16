Rails.application.routes.draw do
  Healthcheck.routes(self)
  devise_for :users

  # Items
  resources :items do
    member do
      patch 'mark'
    end
  end
end
