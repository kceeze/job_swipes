class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :workers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	 def hr_rep?	
	  role == "hr_rep"
	 end

	 def worker? 
	  role == "worker"
	 end

  	def guest? 
  	role == "guest"
	end
end
