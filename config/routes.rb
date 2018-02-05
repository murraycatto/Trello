Rails.application.routes.draw do
  resources :lists
  resources :boards
  resources :teams
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'home#index'

  resources :cards do
    member do
      patch :update_list
      put :update_list
    end
  end

end
