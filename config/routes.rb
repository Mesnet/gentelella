Rails.application.routes.draw do
  resources :ranches do 
    resources :tasks do
      member do 
        patch :done
        patch :undone
        patch :star
        patch :unstar
      end
    end 
  end



  devise_for :users
  
   root 'plainpage#index'

end
