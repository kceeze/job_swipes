class CompaniesController < ApplicationController
	
	def index

	end

	def new

    	@company = Company.new
	    respond_to do |format|
	      format.html 
	      format.json { render json: @company }
	    end
	end

	def create
		  @company = Company.new(company_params)
		  if @company.save
		  	redirect_to companies_path
		  else
		  	render :new
		  end
	end

	private

	def company_params
		params.require(:company).permit(:name, :street, :city, :state,:zip)
	end
end