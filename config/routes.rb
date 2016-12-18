Rails.application.routes.draw do
  get 'busines/index'

  get 'busines/new'

  get 'busines/edit'

  get 'business/index'

  get 'business/new'

  get 'business/edit'

  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mobiles do
    collection do
      get 'reg'
      get 'login'
    end
  end

  resources :users


  resources :wares do
    collection do
      get 'createcla'
    end
  end



  resources :wares
  resources :classifications
  resources :businesssettleds


  resources :busines



end
