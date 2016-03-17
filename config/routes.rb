Rails.application.routes.draw do
  namespace :admin, path: 'tracker' do
    resources :users
    resources :seizures

    root to: "users#index"
  end

  root 'home#index'
  resources :seizures
  get 'average', to: 'seizures#average', as: 'average'
  get 'time_of_day', to: 'home#time_of_day', as: 'time_of_day'
  devise_for :users
end
