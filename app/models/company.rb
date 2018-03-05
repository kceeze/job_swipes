class Company < ApplicationRecord
	has_many :job_postings
	has_many :hr_reps
	after_validation :geocode, if: :address_changed?
	geocoded_by :address

	scope :join_jobs_nearby, lambda {joins("left outer join job_postings on job_postings.company_id = companies.id")}
	scope :job_posting_search, lambda {|search_string| where("job_postings.subject like ?", "%#{search_string}%")}
	def doesnt_have_admin?
		if self.hr_reps.where(company_id: self.id).limit(1).present?
			false
		else
			true
		end 
	end

	def create_hr_rep(user)
		HrRep.create(user_id: user.id, company_id: self.id, admin: true)
		user.role = "hr_rep"
		user.save
	end	

	def address
		[street, city, zip, state].compact.join(", ")
	end

	def address_changed? 
		street_changed? ||city_changed? || zip_changed? || state_changed?
	end
end	
