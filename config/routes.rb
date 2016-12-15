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
  resources :classifications
=======
  resources :businesssettleds

>>>>>>> 89890ba36b21d91bb5c8f91cb823b589b6df1d66


end
