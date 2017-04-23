class Pay2goController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def return
		result = nil
		ActiveRecord::Base.transaction do
		@payment = Payment.find_and_process( json_data )
		result = @payment.save
		end
	
		unless result
			flash[:alert] = t("registration.error.failed_pay")
		end

		@donation = @payment.donation
		@plan = @donation.plan

		if @payment.paid_at
			# send paid email     
		end

		redirect_to plan_donation_path(@plan,@donation)
	end

	def notify
		result = nil
		ActiveRecord::Base.transaction do
			@payment = PaymentPay2go.find_and_process( json_data )
			result = @payment.save
		end

		if result
			render :text => "1|OK"
		else
			render :text => "0|ErrorMessage"
		end
	end

	private
	
	def json_data
		JSON.parse( params["JSONData"] )
	end




end
