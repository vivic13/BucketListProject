class Donation < ApplicationRecord
	validates_presence_of :cc_name, :amount
	belongs_to :npo
	belongs_to :plan
	belongs_to :user
	has_many :payments
	
	def paid?
		self.payment_status == "Paid"
	end
end
