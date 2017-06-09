Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
  
  mount ActionCable.server => '/cable'
  root 'smiggles#edit'
  resources :smiggles, only: [:edit, :update]
end
