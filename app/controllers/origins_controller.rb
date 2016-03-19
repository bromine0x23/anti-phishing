class OriginsController < ApplicationController

	def index
		@origins = Origin.all
		respond_to do |format|
			format.json { render json: @origins}
			format.xml  { render xml: @origins }
		end
	end
end
