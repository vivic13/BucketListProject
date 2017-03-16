class PlansController < ApplicationController
	before_action :authenticate_user!
	before_action :find_plan, only:[:show,:edit, :update, :destroy]

	def index
		@plans=current_user.plans
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

	end

	def update
		if @plan=current_user.plans.update(permit_plan)
			redirect_to plan_path(@plan)
		else
			render :edit
		end
	end

	def destroy
		@plan.destroy
		redirect_to plans_path

	end

	def latest
		@plans=Plan.where(:is_public=>true)
	end

	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :file_location, :is_public,:progress)
	end

	def find_plan
		@plan=Plan.find(params[:id])
	end

end