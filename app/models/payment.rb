class Payment < ApplicationRecord
	PAYMENT_METHODS = %w[Credit WebATM] # ATM CVS BARCODE
	validates_inclusion_of :payment_method, :in => PAYMENT_METHODS
	belongs_to :donation
	serialize :params, JSON
	validate :check_mac, on: :update
	after_update :update_donation_status

	def name
	  "Bucketlist donation"
	end

	def email
	  self.donation.user.email
	end

	def external_id
		"#{self.id}AC12#{Rails.env.upcase[0]}"
	end

	def self.find_and_process(params)
		result = JSON.parse( params['Result'] )
		payment = self.find(result['MerchantOrderNo'].to_i)
		if params['Status'] == 'SUCCESS'
			payment.paid_at = Time.now
		end
		payment.params = params
		payment
	end

	def parse_result
		JSON.parse( self.params['Result'] )
	end

	def check_mac
		pay2go = Pay2go.new(parse_result)
		errors.add(:params, 'wrong mac value') unless pay2go.check_mac
	end

	def update_donation_status
		if self.paid_at
			self.donation.update( :payment_status => "Paid" )
		end
	end

end
