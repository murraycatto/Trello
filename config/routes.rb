Rails.application.routes.draw do
  resources :lists, only: [:create,:update]
  resources :boards, only: [:index,:show,:create]
  resources :teams, only: [:create]


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'home#index'

  resources :cards do
    resources :card_comments, only: [:create]
    resources :checklists, only: [:create]
    member do
      patch :update_list
      put :update_list
    end
  end

end
