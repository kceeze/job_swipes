class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  #before_action :user_completed_application

  # def user_completed_application
  # 		if user_signed_in?
  # 			if(!current_user.complete)
  # 				redirect_to root_path
  # 			end
  # 		end
  # end

  # def current_ability
  #   @current_ability ||= Ability.new(current_user, params[:token])
  # end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

end
