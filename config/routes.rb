Rails.application.routes.draw do
  root to: 'admin/users#index'

  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :new, :create] do
      resource :admins, only: [:create, :destroy]
    end
  end
end
