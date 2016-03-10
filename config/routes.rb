Rails.application.routes.draw do
  namespace :admin, path: 'tracker' do
    resources :users
    resources :seizures

    root to: "users#index"
  end

  # namespace :admin, path: 'zombie-llama' do
  #  DashboardManifest.new.dashboards.each do |dashboard_resource|
  #    resources dashboard_resource
  #  end
  #    root controller: DashboardManifest.new.root_dashboard, action: :index
  #  end

  root 'home#index'
  devise_for :users
  resources :seizures

end
