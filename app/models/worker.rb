class Worker < ApplicationRecord
	has_many :names, dependent: :destroy
	has_many :phone_numbers, dependent: :destroy
	has_many :physical_addresses, dependent: :destroy
	has_many :email_addresses, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :names, :reject_if => lambda {|a| a[:first_name].blank?}, :allow_destroy => true
	accepts_nested_attributes_for :phone_numbers, :allow_destroy => true
	accepts_nested_attributes_for :physical_addresses, :allow_destroy => true
	accepts_nested_attributes_for :email_addresses,  :allow_destroy => true

	def preferred_address
		self.physical_addresses.first.address
	end	

end	
