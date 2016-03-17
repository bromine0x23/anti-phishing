class StatusController < ApplicationController

	def index
		@statuses = Status.all
		respond_to do |format|
			format.json { render json: @statuses}
			format.xml  { render xml: @statuses }
		end
	end
end
