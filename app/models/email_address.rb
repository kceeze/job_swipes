class EmailAddress < ApplicationRecord
	belongs_to :worker, dependent: :destroy
end	
