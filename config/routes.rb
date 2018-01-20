Rails.application.routes.draw do
  resources :boards
  resources :teams
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
