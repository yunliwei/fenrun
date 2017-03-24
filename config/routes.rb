Rails.application.routes.draw do


  get 'banners/index'

  get 'banners/edit'

  get 'banners/new'


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
      get 'collect'
      get 'buy'
      get 'createorder'
      get 'createshopcar'
      get 'shopcar'
      get 'busineselect'
      get 'orderdetail'
      get 'collectlist'
      get 'destroycollect'
      get 'searchcollect'
      get 'destroyshopcar'
      get 'selectjifen'
      get 'selectlabel'
      get 'businepicture'
      get 'userinformation'
      get 'isselectaddress'
      get 'createaddress'
      get 'addresslist'
      get 'deleteaddress'
      get 'updateaddress'
      get 'warepicture'
      get 'editpassword'

    end
  end

  resources :users



  resources :wares do
  resources :warepictures
  collection do
    get 'createtype'
    get 'createwarelabel'
    get 'renderwarebiaoqian'
    get 'upload'
  end
  end



  resources :banners



  resources :settings

  resources :wares
  resources :classifications
  resources :businesssettleds
  resources :malls
  resources :busines do
  resources :businespictures
  end
  resources :waretypes
 resources :adviertisements

end
