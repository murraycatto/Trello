Rails.application.routes.draw do
  resources :lists, only: %i[create update]
  resources :boards, only: %i[index show create]
  resources :teams, only: [:create]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'home#index'

  get 'checklist_item_status/:id', to: 'checklist_items#update_status'

  resources :cards do
    resources :card_comments, only: [:create]

    resources :checklists, only: [:create] do
      resources :checklist_items, only: [:create]
    end
    member do
      patch :update_list
      put :update_list
    end
  end
end
