Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :roles
  devise_for :users
  resources :reports
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'companies#index'
end
