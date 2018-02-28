class Name < ApplicationRecord
	belongs_to :worker, dependent: :destroy
end	
