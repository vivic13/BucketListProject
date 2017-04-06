class UserProfilesController < ApplicationController
	
	def show
		@user=User.friendly.find(params[:id])
		@user.to_param

		@plan_count = Plan.where(:host => @user.nickname).count

	end



end
