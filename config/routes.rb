Rails.application.routes.draw do
  resources :ranches do 
    resources :tasks do
      member do 
        patch :done
      end
    end 
  end



  devise_for :users
  
   root 'plainpage#index'

end
