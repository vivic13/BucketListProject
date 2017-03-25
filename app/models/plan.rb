class Plan < ApplicationRecord
	mount_uploader :file_location, PhotoImageUploader
	validates_presence_of :title, :message => "願望主題不能空白"
	validates_presence_of :duedate, :message => "預計完成日不能空白"

	has_many :memberships
	has_many :users, :through => :memberships
	has_many :comments, dependent: :destroy
	has_many :tag_plan_rp
	has_many :tag_categories, :through => :tag_plan_rp
	has_one :donation
end
