class DonationsController < ApplicationController
	before_action :authenticate_user!
	
	def index 
		@donations = Donation.where(:user_id => current_user.id)
	end





end
