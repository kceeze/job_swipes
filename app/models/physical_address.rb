class PhysicalAddress < ApplicationRecord
	belongs_to :worker, dependent: :destroy
end	
