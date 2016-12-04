Rails.application.routes.draw do
  resources :ranches do 
    resources :tasks do
      member do 
        patch :done
        patch :undone
      end
    end 
  end



  devise_for :users
  
   root 'ranches#index'

end
