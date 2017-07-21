Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, 
    controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" },
    skip: [:registrations, :passwords]

  devise_scope :user do
    resource :registration,
      only: [:new, :create],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end
  
  mount ActionCable.server => '/cable'
  root 'smiggles#edit'
  resources :smiggles, only: [:create, :edit, :update] do
    post :resurrect
  end
end
