Rails.application.routes.draw do
  namespace :admin, path: 'tracker' do
    resources :users
    resources :seizures

    root to: "users#index"
  end

  root 'home#index'
  resources :seizures
  get 'average', to: 'seizures#average', as: 'average'
  devise_for :users
end
