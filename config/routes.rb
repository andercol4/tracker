Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
    resources :seizures

    root to: "users#index"
  end

  root 'home#index'
  devise_for :users
  resources :seizures

end
