Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items do
    resources :order only: :index
  end
end
