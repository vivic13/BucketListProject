class PlansController < ApplicationController
	
	def index
		@plans=Plan.all
	end

	def new
		@plan=Plan.new

	end

	def create
		@plan=Plan.new(permit_plan)
		@plan.save
		redirect_to plans_path

	end

	def show

	end

	def edit 

	end

	def update

	end

	def destroy

	end

	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :img_location)
	end

end
