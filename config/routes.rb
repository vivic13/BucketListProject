Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  

  resources :plans do 
  	resources :comments, :controller => 'plan_comments'
    resources :donations, :controller => 'plan_donations'
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
