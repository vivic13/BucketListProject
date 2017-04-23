Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  post 'pay2go/return'
  post 'pay2go/notify'

  resources :users, only:[:show], :controller => 'user_profiles'

  resources :donations, only:[:index], :controller => 'donations'

  resources :plans do 
  	resources :comments, only:[:create,:destroy], :controller => 'plan_comments'
    resources :donations, only:[:new, :create, :show], :controller => 'plan_donations' do 
      member do
        post :checkout_pay2go
      end
    end
    resources :photos, only:[:create, :destroy], :controller => 'plan_photos'
  	collection do
      get :latest
      get :follow_plan
      get :like_plan
    end
    member do 
    	post :follow
    	post :unfollow
      post :like
      post :unlike
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
