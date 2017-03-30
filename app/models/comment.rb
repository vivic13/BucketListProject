class Comment < ApplicationRecord
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates_presence_of :comment_body
 	belongs_to :plan,	:counter_cache => true
end
