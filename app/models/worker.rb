class Worker < ApplicationRecord
	has_many :names, dependent: :destroy
	has_many :phone_numbers, dependent: :destroy
	has_many :physical_addresses, dependent: :destroy
	has_many :email_addresses, dependent: :destroy
end	
