class PlanCommentsController < ApplicationController

	before_action :find_plan


	def create
		@comment=@plan.comments.new(comment_params)
		if @comment.save
			respond_to do |format|
	      format.html { redirect_to plan_path(@plan)}
	      format.js	 # create.js.erb
    	end
		else
			flash[:alert] = "請至少輸入ㄧ個字!"	
		end

	end


	def destroy
		
		@comment=@plan.comments.find(params[:id])
		@comment.destroy
		if @comment.commenter == current_user.nickname || @plan.host == current_user.nickname ||current_user.role == "admin"
			respond_to do |format|
	      format.html { redirect_to plan_path(@plan)}
	      format.js	 # destroy.js.erb
    	end
			
		else
			flash[:alert] = "something went wrong!"	
		end

	end

	private

	def find_plan
		@plan=Plan.find(params[:plan_id])
	end

	def comment_params
		params.require(:comment).permit(:comment_body, :commenter)
	end





end
