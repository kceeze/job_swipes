class CompaniesController < ApplicationController
	load_and_authorize_resource
	def index

	end

	def show

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
		  	if(@company.doesnt_have_admin?)
		  		@company.create_hr_rep(current_user)
		  	end
		  	redirect_to company_path(@company.id)
		  else
		  	render :new
		  end
	end

	private

	def company_params
		params.require(:company).permit(:name, :street, :city, :state,:zip)
	end


end