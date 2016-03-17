module ApplicationHelper

	def has_permission(*codes)
		if (user = session[:user]) and user.permissions.exists? code: codes
			yield
		end
	end

	def no_permission(*codes)
		if not (user = session[:user]) or not user.permissions.exists? code: codes
			yield
		end
	end

	def body_class
		''
	end

	def login_url
		new_sessions_url
	end
end