require 'digest'

class UsersController < ApplicationController

	layout false

	def index
		@users = User.all
	end

	def destroy
		@user = User.find params[:id]
	end
end
