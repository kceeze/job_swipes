class HomeController < ApplicationController
	
	before_action :check_user_role
	def index

	end



	def check_user_role
	   	if current_user.worker? 
	   		redirect_to worker_path(current_user.assocation_id("worker"))
	   	elsif current_user.hr_rep?
	   		redirect_to company_path(current_user.assocation_id("hr_rep"))
	   	end 
	end

end