Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  

  resources :plans do 
  	resources :comments, :controller=>'plan_comments'
  	collection do
      get :latest
    end
    member do 
    	post :follow
    	post :unfollow
    end
  end



  root "plans#latest"
end
