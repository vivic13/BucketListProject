class Comment < ApplicationRecord
	has_attached_file :image,:default_url => 'upload_image.png', styles: { small: "64x64"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates_presence_of :comment_body
 	belongs_to :plan,	:counter_cache => true
 	default_scope { order(created_at: :desc) }
end
