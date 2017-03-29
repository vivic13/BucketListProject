class UserProfilesController < ApplicationController
	
	def show
		@user=User.friendly.find(params[:id])
		@user.to_param
		@plans=@user.plans.where(:is_public => true)
	end



end
