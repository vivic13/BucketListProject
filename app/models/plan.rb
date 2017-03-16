class Plan < ApplicationRecord
	mount_uploader :file_location, PhotoImageUploader
	validates_presence_of :title, :duedate, :progress, :file_location
	belongs_to :user
	has_many :comments, dependent: :destroy
end
