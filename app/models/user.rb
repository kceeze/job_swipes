class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :workers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def give_role(role)
    	self.role = "worker"
		self.save
    end
	 def hr_rep?	
	  role == "hr_rep"
	 end

	 def worker? 
	  role == "worker"
	 end

  	def guest? 
  	role == "guest"
	end

	def can_search_job
		
	end

	def assocation_id(role)
		if(self.worker?)
			self.workers.first.id
		end
	end
end
