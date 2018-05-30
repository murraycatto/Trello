Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'toggle_checklist_item_status/:id', to: 'checklist_items#toggel_status'

  resources :lists, only: %i[create update]
  resources :boards, only: %i[index show create]
  resources :labels, only: %i[create update edit]
  resources :teams, only: [:create]

  resources :cards do
    resources :card_comments, only: [:create]
    resources :checklists, only: [:create], shallow: true do
      resources :checklist_items, only: [:create]
    end
    member do
      put :update_list
    end
  end
end
