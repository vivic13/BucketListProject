class TagCategoriesController < ApplicationController

	def show 
		@tag = TagCategory.find(params[:id])
		@plans= @tag.plans.where(:is_public => true)
	end

end
