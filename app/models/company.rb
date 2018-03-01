class Company < ApplicationRecord
	has_many :job_postings
	has_many :hr_reps
end	
