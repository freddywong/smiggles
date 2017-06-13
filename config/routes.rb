Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
  
  mount ActionCable.server => '/cable'
  root 'smiggles#edit'
  resources :smiggles, only: [:create, :edit, :update] do
    post :resurrect
  end
end
