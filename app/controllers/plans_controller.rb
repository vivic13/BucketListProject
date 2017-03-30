class PlansController < ApplicationController
	before_action :authenticate_user!, except:[:latest,:show]
	before_action :find_plan, only:[:show, :edit, :update, :destroy, :follow, :unfollow]

	def index
			@page_title = "你的List"
			@current_user_plan = current_user.plans.where(:host => current_user.nickname)
			#if params[:keyword]
	    #	@plans = @current_user_plan.where( [ "title like ?", "%#{params[:keyword]}%" ] )
	  	#else
	  	
	  	@plans = @current_user_plan
	   

	  	respond_to do |format|
		    format.html # index.html.erb
		    #format.json { render :json => @plans.to_json }
 			 end

	  	if params[:order]
	  		sort_by = (params[:order] == 'duedate') ? 'duedate' : 'duedate'
	  		@plans = @current_user_plan.order(sort_by)
	  	end

	  	
	end

	def new
		@page_title = "新增List"
		@plan = Plan.new

	end

	def create
		@plan = Plan.new(permit_plan)
		@plan.host = current_user.nickname

		
		if @plan.save
			@membership = Membership.create(:user => current_user,:plan => @plan)
			respond_to do |format|
				  format.html { redirect_to plans_path}
				  format.js
				end		
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
		@page_title = "編輯List"
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
			respond_to do |format|
				format.html { redirect_to plans_path}
				format.js
			end
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
		@page_title = "你的Follow Lists"
		@plans = current_user.plans.where.not(:host => current_user.nickname)
	end

	def latest
		@page_title = "大家的Lists"
		if params[:order]
			sort_by = (params[:order] == 'comments_count') ? 'comments_count' : 'comments_count'
			@plans = Plan.where(:is_public => true).order(sort_by).reverse
		elsif params[:last]
			sort_by = (params[:last] == 'last_plan') ? 'updated_at' : 'updated_at'
			@plans = Plan.where(:is_public => true).order(sort_by).reverse

		else
			@plans = Plan.where(:is_public => true).includes(:comments).order('comments.created_at desc')
		
		end
		
		
	end

	
	
	private

	def permit_plan
		params.require(:plan).permit(:title, :duedate, :plan, :do_what, :check, :act, :file_location, :is_public, :progress,:why, :tag_category_ids => [])
	end

	def find_plan
		@plan = Plan.find(params[:id])
	end

end