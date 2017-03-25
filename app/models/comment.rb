class Comment < ApplicationRecord
	validates_presence_of :comment_body
 	belongs_to :plan

end
