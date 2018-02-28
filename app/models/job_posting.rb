class JobPosting < ApplicationRecord
	belongs_to :company, dependent: :destroy
end	
