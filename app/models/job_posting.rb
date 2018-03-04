class JobPosting < ApplicationRecord
	belongs_to :company, dependent: :destroy
	accepts_nested_attributes_for :company

	scope :worker_search, lambda {|search_string| where("lower(subject) LIKE lower(?)", "%#{search_string}%")}
	scope :company_join, lambda {joins("LEFT JOIN companies ON job_postings.company_id = companies.id")}
end		
