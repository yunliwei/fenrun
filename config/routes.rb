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
  resources :settings
  resources :wares
  resources :classifications
  resources :businesssettleds
  resources :malls
  resources :busines



end
