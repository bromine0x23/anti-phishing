class IndexController < ApplicationController

	def index
		@user = session[:user]
	end
end
