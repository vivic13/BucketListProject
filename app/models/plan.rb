class Plan < ApplicationRecord
	
	validates_presence_of :title, :duedate, :is_public, :progress
	belongs_to :user
	has_many :comments
end
