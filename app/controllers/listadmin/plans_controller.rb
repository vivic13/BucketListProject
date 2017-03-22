class Listadmin::PlansController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_plan, only:[:show, :edit, :update, :destroy]
  layout "admin"

    def index 
    	@plans = Plan.all
    end

    def new 
    	@plan = Plan.new

    end

    def create  
    	@plan=Plan.new(permit_plan)
			@plan.host=current_user.nickname
			if @plan.save
				@membership=Membership.create(:user => current_user,:plan => @plan)
				redirect_to listadmin_plans_path
			else 
				render :new
			end
    end

    def show
    	@page_title=@plan.title
			@follower=@plan.users.count-1
    end

    def edit
    end

    def update
    	@plan.update(permit_plan)
			redirect_to listadmin_plan_url(@plan)
    end

    def destroy
    	@plan.destroy
			redirect_to listadmin_plans_path
    	
    end

    protected

    def check_admin
    	unless current_user.role == "admin"
    		raise ActiveRecord::RecordNotFound
    	end      
    end

    def permit_plan
			params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :file_location, :is_public,:progress,:tag_category_ids => [])
		end

		def find_plan
			@plan=Plan.find(params[:id])
		end


end
