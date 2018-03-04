class JobSearchesController < ApplicationController
	#load_and_authorize_resource
	def index
		@job_searches = JobSearch.where(worker_id: params[:worker_id])
	end

	def new
		@worker = Worker.find(params[:worker_id])
		@job_search = JobSearch.new
	end

	def create
		@job_search = JobSearch.create(search_string: params[:job_search][:search_string], worker_id: worker_id_param, distance: distance_param)
		redirect_to worker_job_search_path(worker_id: worker_id_param, id: @job_search[:id])
	end

	def show 

		@job_search = JobSearch.find(params[:id])
		if(@job_search[:distance].present?)
			@distance = @job_search[:distance]
		else
			@distance = 50
		end
		@worker = Worker.find(worker_id_param)
		@companies = Company.near(@worker.preferred_address, @distance).join_jobs_nearby.job_posting_search("#{@job_search[:search_string]}")
	end

	private

	def search_string_param
		params.require(:job_search).permit(:search_string)
	end

	def worker_id_param
		params.require(:worker_id)
	end

	def distance_param
		params.require(:distance)
	end

end