class TagCategory < ApplicationRecord
	has_many :tag_plan_rp
	has_many :plans, :through => :tag_plan_rp
end
