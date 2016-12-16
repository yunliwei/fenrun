Rails.application.routes.draw do
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mobiles do
    collection do
      get 'reg'
      get 'login'
    end
  end

  resources :users
<<<<<<< HEAD
  resources :wares
=======

  resources :classifications

  resources :businesssettleds

  resources :malls



>>>>>>> cfc2e764252908880ce9fa0a99c938b312447c39


end
