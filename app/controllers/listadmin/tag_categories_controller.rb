class Listadmin::TagCategoriesController < ApplicationController

	def index 
		@tags = TagCategory.all
	end

	
	def create

		@tag= TagCategory.new(permit_tag)
		if @tag.save
			redirect_to listadmin_tag_categories_path
		else 
			render :index
		end

	end

	def destroy
		@tag = TagCategory.find(params[:id])
		@tag.destroy
		redirect_to listadmin_tag_categories_path

	end

	private

	def permit_tag
		params.require(:tag_category).permit(:name)
	end

	def check_admin
    	unless current_user.role == "admin"
    		raise ActiveRecord::RecordNotFound
    	end      
   end
end
