require 'digest'

class SessionsController < ApplicationController

	skip_before_action :require_login

	def create
		parameters = params.require(:session)
		@user = User.find_by(username: parameters[:username], password: Digest::SHA512.hexdigest(parameters[:password]))
		reset_session
		session[:user] = @user
	end

	def destroy
		session.delete(:user)
		redirect_to login_url
	end
end
