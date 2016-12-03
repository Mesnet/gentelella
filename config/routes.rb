Rails.application.routes.draw do
  resources :ranches do 
    resources :tasks 
  end



  devise_for :users
  
   root 'plainpage#index'

end
