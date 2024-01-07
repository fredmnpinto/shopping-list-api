Rails.application.routes.draw do
  devise_for :users

  # Items
  resources :items do
    patch 'check'
  end
end
