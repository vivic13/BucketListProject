class PlanDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_plan , except:[:checkout_pay2go]

	

	def new
		@donation = @plan.build_donation
	end

	def create
		@donation = @plan.build_donation(donation_params)
		@donation.user_id = current_user.id
		if @donation.save
			redirect_to plan_donation_path(@plan,@donation)
		else
			render :new
		end
	end

	def show 
		if current_user.nickname == @plan.host || current_user.role == "admin"
			@donation = current_user.donations.find( params[:id] )
		end


	end

	def checkout_pay2go
		@donation = current_user.donations.find( params[:id] )

		if @donation.paid?
			redirect_to :back, alert: 'already paid!'
		else
			@payment = Payment.create!( :donation => @donation,:payment_method => params[:payment_method],
                                  :amount => @donation.amount )
			render :layout => false
		end
	end

	private 

	def find_plan
		@plan = Plan.find(params[:plan_id])
	end

	def donation_params
		params.require(:donation).permit(:cc_name, :amount, :npo_id)
	end

end



