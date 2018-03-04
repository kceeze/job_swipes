class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_action :user_completed_application

  def user_completed_application
  		if user_signed_in?
  			if(!current_user.complete)
  				redirect_to root_path
  			end
  		end
  end
end
