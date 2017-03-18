class Plan < ApplicationRecord
	mount_uploader :file_location, PhotoImageUploader
	validates_presence_of :title, :duedate, :progress, :file_location
	has_many :memberships
	has_many :users, :through => :memberships
	has_many :comments, dependent: :destroy
	has_one :donation
end
