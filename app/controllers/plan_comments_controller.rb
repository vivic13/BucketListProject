class PlanCommentsController < ApplicationController

	before_action :find_plan


	def create
		@comment=@plan.comments.create(comment_params)
		redirect_to plan_path(@plan)

	end


	def destroy
		@comment=@plan.comments.find(params[:id])
		
		@comment.destroy
		redirect_to plan_path(@plan)

	end

	private

	def find_plan
		@plan=Plan.find(params[:plan_id])
	end

	def comment_params
		params.require(:comment).permit(:comment_body, :commenter)
	end





end
