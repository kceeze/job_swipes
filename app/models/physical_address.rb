class PhysicalAddress < ApplicationRecord
	belongs_to :worker

	def address
		[street, city, zip, state].compact.join(", ")
	end
end	
