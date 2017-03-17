class PlansController < ApplicationController
	before_action :authenticate_user!, except:[:latest]
	before_action :find_plan, only:[:show, :edit, :update, :destroy]

	def index

			if params[:keyword]
	    	@plans = current_user.plans.where( [ "title like ?", "%#{params[:keyword]}%" ] )
	  	else
	    	@plans = current_user.plans
	  	end

	  	if params[:order]
	  		sort_by = (params[:order] == 'title') ? 'title' : 'duedate'
	  		@plans = current_user.plans.order(sort_by)
	  	end

	end

	def new
		@plan=current_user.plans.new

	end

	def create
		@plan=current_user.plans.new(permit_plan)
		@plan.user=current_user
		if @plan.save
			redirect_to plans_path
		else 
			render :new
		end

	end

	def show
		@page_title=@plan.title

	end

	def edit 
		if @plan.user != current_user
			flash[:alert]="something went wrong!"
		end

	end

	def update

		if @plan.user == current_user
			if @plan.update(permit_plan)
				redirect_to plans_path
			else
				render :edit
			end
		else 
			flash[:alert] = "something went wrong!"	
		end
	end

	def destroy
		if @plan.user == current_user
			@plan.destroy
			redirect_to plans_path
		else
			flash[:alert] = "something went wrong!"	
		end

	end

	def latest
		@plans=Plan.where(:is_public=>true).order(duedate: :desc)
	end

	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :file_location, :is_public,:progress)
	end

	def find_plan
		@plan=Plan.find(params[:id])
	end

end