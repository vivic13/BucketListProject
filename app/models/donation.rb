class Donation < ApplicationRecord
	validates_presence_of :cc_name, :amount
	belongs_to :npo
	belongs_to :user
end
