class PlanDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_plan

	

	def new
		@donation=@plan.build_donation
	end

	def create
		@donation=@plan.build_donation(donation_params)
		@donation.user_id = current_user.id
		if @donation.save
			redirect_to plan_path(@plan)
		else
			render :new
		end
	end

	def show 
		if current_user.nickname == @plan.host || current_user.role == "admin"
			@donation = @plan.donation
		end


	end


	private 

	def find_plan
		@plan=Plan.find(params[:plan_id])
	end

	def donation_params
		params.require(:donation).permit(:cc_name, :amount, :npo_id)
	end

end



