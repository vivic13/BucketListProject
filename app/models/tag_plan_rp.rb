class TagPlanRp < ApplicationRecord
	belongs_to :tag_category
	belongs_to :plan
end
