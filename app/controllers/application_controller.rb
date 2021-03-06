class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :set_locale, :require_login

	def body_class
		''
	end

	def login_url
		new_session_url
	end

	def current_user
		session[:user]
	end

	private

	def set_locale
		request.accept_language.split(',').each do |language|
			if I18n.available_locales.include? language
				I18n.locale = language
				break
			end
		end
	end

	def require_login
		unless current_user
			if request.xhr?
				head :forbidden
			else
				# flash[:error] = 'You must be logged in to access this section'
				redirect_to login_url
			end
		end
	end
end