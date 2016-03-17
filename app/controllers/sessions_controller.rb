require 'digest'

class SessionsController < ApplicationController

	skip_before_action :require_login

	def create
		user = User.find_by(username: params[:username], password: Digest::SHA512.hexdigest(params[:password]))
		result =
			if user
				session[:user] = user
				{ status: true }
			else
				{ status: false, message: translate('session.create.login_failed') }
			end
		respond_to do |format|
			format.json { render json: result }
			format.xml { render xml: result }
		end
	end

	def destroy
		session.delete(:user)
		redirect_to login_url
	end
end
