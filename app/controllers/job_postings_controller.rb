class JobPostingsController < ApplicationController
	def index
		@job_postings = JobPosting.where(company_id: params[:company_id])
	end

	def new
		@company = Company.find(params[:company_id])
		@job_posting = JobPosting.new
		respond_to do |format|
	      format.html 
	      format.json { render json: @company }
	    end
	end

	def create
		@job_posting = JobPosting.new(subject: params[:job_posting][:subject], description: params[:job_posting][:description], company_id: params[:company_id] )
		if @job_posting.save
		  	redirect_to company_job_posting_path(company_id: params[:company_id], id: @job_posting[:id])
		else
			@company = Company.find(params[:company_id])
			@job_posting = JobPosting.new
			render :new
		end

	end	

	def show
		@job_posting = JobPosting.find(params[:id])
	end

	private

	def job_posting_params
		params.require(:job_posting).permit(:subject, :description, companies_attributes: [:id])
	end

end