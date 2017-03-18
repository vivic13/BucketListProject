class PlanDonationsController < ApplicationController
	
	before_action :find_plan, except:[:index]

	def new
		@donation=@plan.build_donation

	end

	def create
		@donation=@plan.build_donation(donation_params)
		if @donation.save
			redirect_to plan_path(@plan)
		else
			render :new
		end
	end

	def show 
		if current_user.nickname == @plan.host
			@donation=@plan.donation
		end


	end


	private 

	def find_plan
		@plan=Plan.find(params[:plan_id])
	end

	def donation_params
		params.require(:donation).permit(:cc_name, :amount, :cc_num, :cc_last, :cc_duedate, :npo_id)
	end

end



