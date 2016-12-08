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


  resources :staffs
  devise_for :users

  post '/' => 'users#create', :as => 'user'
  
  root 'plainpage#index'

end
