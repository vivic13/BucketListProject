class UserProfilesController < ApplicationController
	
	def show
		@user=User.find(params[:id])
		@plans=@user.plans.where(:is_public => true)

	end



end
