class Plan < ApplicationRecord
	validates_presence_of :title, :duedate, :plan, :do_what, :check, :act, :img_location, :is_public, :progress
end
