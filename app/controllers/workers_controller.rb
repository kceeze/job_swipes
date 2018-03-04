class WorkersController < ApplicationController
	def index
		@workers = Workers.all
	end

	def new
		@worker = Worker.new
		@name = @worker.names.build
		@email_address = @worker.email_addresses.build
		@physical_address = @worker.physical_addresses.build
		@phone_numbers = @worker.phone_numbers.build
		respond_to do |format|
	      format.html 
	      format.json { render json: @worker }
	    end
	end

	def create
		@worker = Worker.new(worker_params)
		@worker.user_id = current_user.id
		if @worker.save
		  redirect_to worker_path(id: @worker.id)
		else
			@worker = Worker.new
			render :new
		end

	end	

	def show
		@worker = Worker.find(params[:id])
	end

	private

	def worker_params
		params.require(:worker).permit(:user_id, physical_addresses_attributes: [:street, :city, :state, :zip, :_destroy], names_attributes: [:first_name, :last_name, :_destroy], phone_numbers_attributes: [:number, :_destroy], email_addresses_attributes: [:email, :_destroy])
	end

end