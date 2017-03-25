class PlansController < ApplicationController
	before_action :authenticate_user!, except:[:latest,:show]
	before_action :find_plan, only:[:show, :edit, :update, :destroy, :follow, :unfollow]

	def index
			@current_user_plan = current_user.plans.where(:host => current_user.nickname)
			#if params[:keyword]
	    #	@plans = @current_user_plan.where( [ "title like ?", "%#{params[:keyword]}%" ] )
	  	#else
	  	
	    @plans = @current_user_plan
	  	#end

	  	if params[:order]
	  		sort_by = (params[:order] == 'duedate') ? 'duedate' : 'duedate'
	  		@plans = @current_user_plan.order(sort_by)
	  	end

	  	if params[:tag]
	  		@tag=TagCategory.where(:name => params[:tag])
	  		@plans=@tag.plans.where(:host => current_user.nickname)
	  	end

	end

	def new
		@plan = Plan.new

	end

	def create
		@plan = Plan.new(permit_plan)
		@plan.host = current_user.nickname
		if @plan.save
			@membership = Membership.create(:user => current_user,:plan => @plan)
			redirect_to plans_path
		else 
			render :new
		end

	end

	def show
		@page_title = @plan.title
		@follower = @plan.users.count-1
		@comment_no = @plan.comments.count

	end

	def edit 
		if @plan.host != current_user.nickname || current_user.role != "admin"
			flash[:alert]="something went wrong!"
		end

	end

	def update

		if @plan.host == current_user.nickname || current_user.role == "admin"
			if @plan.update(permit_plan)
				redirect_to plan_url(@plan)
			else
				render :edit
			end
		else 
			flash[:alert] = "something went wrong!"	
		end
	end

	def destroy
		if @plan.host == current_user.nickname || current_user.role == "admin"
			@plan.destroy
			redirect_to plans_path
		else
			flash[:alert] = "something went wrong!"	
		end

	end

	def follow
		unless @plan.host == current_user.nickname || @plan.users.include?(current_user)
			@membership = Membership.create(:user => current_user, :plan => @plan)
			redirect_to plan_url(@plan)
		end
	end

	def unfollow
		if @plan.users.include?(current_user)
			@membership = Membership.find_by(:user => current_user, :plan => @plan)
			@membership.destroy
			redirect_to plan_url(@plan)
		end

	end
	def follow_plan
		@plans = current_user.plans.where.not(:host => current_user.nickname)
	end

	def latest
		@plans = Plan.where(:is_public => true).order(updated_at: :desc)
		
	end

	
	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :file_location, :is_public, :progress,:why, :tag_category_ids => [])
	end

	def find_plan
		@plan = Plan.find(params[:id])
	end

end