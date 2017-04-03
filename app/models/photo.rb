class Photo < ApplicationRecord
	belongs_to :plan
	has_attached_file :image, styles: { med: "100x100"},:default_url => 'upload_more_image.png'
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
