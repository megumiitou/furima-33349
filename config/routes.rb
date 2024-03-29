Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: 'items#index'

  resources :items do
    resources :buys, only: [:new, :create]
  end

end
