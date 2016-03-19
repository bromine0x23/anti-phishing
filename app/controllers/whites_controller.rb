class WhitesController < ApplicationController

	layout false

	def create
		@white = White.new params.require(:create).permit(*%i(url)) do |white|
			white.disposer = current_user
		end
	end

	def index
		@whites = White.all
	end

	def destroy
		@white = White.find params[:id]
	end
end
