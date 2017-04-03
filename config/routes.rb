Rails.application.routes.draw do
  resources :reports
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'companies#index'
end
