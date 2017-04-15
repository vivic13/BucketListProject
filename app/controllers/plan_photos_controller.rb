class PlanPhotosController < ApplicationController
	before_action :find_plan
	before_action :authenticate_user!
	def create 
		if @plan.host == current_user.nickname ||current_user.role == "admin"
			@photo = @plan.photos.new(photo_params)
			if @photo.save 

			respond_to do |format|
		      format.html { redirect_to plan_path(@plan)}
		      format.js	 
	    	end
			else
				flash[:alert] = "請至少上傳ㄧ張圖片!"	
			end
		end
	end


	def destroy
		@photo=@plan.photos.find(params[:id])
		@photo.destroy
		if @plan.host == current_user.nickname ||current_user.role == "admin"
			respond_to do |format|
	      format.html { redirect_to plan_path(@plan)}
	      format.js	 
    	end
			
		else
			flash[:alert] = "something went wrong!"	
		end

	end







	private

	def find_plan
		@plan=Plan.find(params[:plan_id])
	end

	def photo_params
		params.require(:photo).permit(:image)
	end

end
