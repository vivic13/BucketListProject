class PlansController < ApplicationController
	before_action :authenticate_user!, except:[:latest,:show]
	before_action :find_plan, only:[:show, :edit, :update, :destroy, :follow, :unfollow, :like, :unlike]

	def index
			@page_title = "你的plans"
			@current_user_plan = Plan.where(:host => current_user.nickname)
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
		@comment_no = @plan.comments.count
		@follow_count = @plan.memberships.count
		@like_count = @plan.likes.count
		@plan.page_view ||= 0
		@plan.page_view +=1
		@plan.save
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
		
		unless @plan.host == current_user.nickname || @plan.already_followed(current_user)
			@membership = Membership.create(:user => current_user, :plan => @plan)
			redirect_to plan_url(@plan)
		end
	end

	def unfollow

		if @plan.already_followed(current_user)
			@membership = @plan.find_follow(current_user)
			@membership.destroy
			redirect_to plan_url(@plan)
		end

	end

	def like 
		unless @plan.host == current_user.nickname || @plan.already_liked(current_user)
			@like = Like.create(:user => current_user, :plan => @plan)
			redirect_to plan_url(@plan)
		end

	end

	def unlike
		if @plan.already_liked(current_user)
			@like = @plan.find_like(current_user)
			@like.destroy
			redirect_to plan_url(@plan)
		end

	end


	def follow_plan
		@page_title = "你Follow的plan"
	
	end


	def like_plan
		@page_title = "你like的plan"
	end

	def latest
		@page_title = "大家的plans"
		if params[:order]
			sort_by = (params[:order] == 'comments_count') ? 'comments_count' : 'comments_count'
			@plans = Plan.where(:is_public => true).order(sort_by).reverse
		
		elsif params[:comment_last] == 'comment_last'

			@plans = Plan.where(:is_public => true).includes(:comments).order('comments.created_at desc')
		
		elsif params[:page]== 'view'
			
			@plans = Plan.where(:is_public => true).order('page_view desc')
		else
			
			@plans = Plan.where(:is_public => true).order('created_at desc')

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