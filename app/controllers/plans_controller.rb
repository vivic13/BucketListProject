class PlansController < ApplicationController
	before_action :find_plan, only:[:show,:edit, :update, :destroy]

	def index
		@plans=Plan.all
	end

	def new
		@plan=Plan.new

	end

	def create
		@plan=Plan.new(permit_plan)
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
		if @plan=Plan.update(permit_plan)
			redirect_to plan_path(@plan)
		else
			render :edit
		end
	end

	def destroy
		@plan.destroy
		redirect_to plans_path

	end

	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :img_location, :is_public)
	end

	def find_plan
		@plan=Plan.find(params[:id])
	end

end
