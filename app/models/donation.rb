class Donation < ApplicationRecord
	validates_presence_of :cc_name, :amount, :cc_num, :cc_last, :cc_duedate
	belongs_to :plan
	belongs_to :npo
end
