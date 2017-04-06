class Listadmin::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_user, only:[:show, :edit, :update, :destroy]
  layout "admin"

    def index 
      @users = User.all

    end

    

    def show
    	
    end

    def edit
    end

    def update
    	@user.update(permit_user)
      redirect_to listadmin_user_path(@user)
    end

    def destroy
    	
    	
    end

    protected

    def check_admin
    	unless current_user.role == "admin"
    		raise ActiveRecord::RecordNotFound
    	end      
    end

    def permit_user
      params.require(:user).permit(:last_name, :role, :email, :fb_uid, :fb_token, :introduction)

    end

    def find_user
	   @user = User.find(params[:id])
    end


end
