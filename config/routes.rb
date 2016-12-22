Rails.application.routes.draw do


  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mobiles do
    collection do
      get 'reg'
      get 'login'
      get 'search'
      get 'shangjiaruzhu'
      get 'warelist'
      get 'selecttype'
      get 'businelist'
      get 'detail'
    end
  end

  resources :users



  resources :wares do
  collection do
    get 'update'
  end
  end
    
    
  




  resources :settings

  resources :wares
  resources :classifications
  resources :businesssettleds
  resources :malls
  resources :busines



end
