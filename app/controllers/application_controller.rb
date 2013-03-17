class ApplicationController < ActionController::Base
	protect_from_forgery

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	protected
	def is_admin
		unless (current_user && current_user.admin)
			redirect_to root_path, :notice => "Forbidden URL"
		end
  	end
end
