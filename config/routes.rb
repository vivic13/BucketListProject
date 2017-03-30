Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users, only:[:show], :controller => 'user_profiles'

  resources :plans do 
  	resources :comments, :controller => 'plan_comments'
    resources :donations, :controller => 'plan_donations'
    resources :photos, :controller => 'plan_photos'
  	collection do
      get :latest
      get :follow_plan
    end
    member do 
    	post :follow
    	post :unfollow
    end
  end

  resources :tag_categories, only:[:show], :controller => 'tag_categories'


  namespace :listadmin do
    resources :users
    resources :tag_categories
  end


  get"/home", to:"home#homepage", :controller => 'home'
  get"/about", to:"home#about", :controller => 'home'
  get"/how_it_works", to:"home#works", :controller => 'home'

  root "home#homepage"
end
