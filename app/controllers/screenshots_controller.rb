class ScreenshotsController < ApplicationController

	layout false

	def show
		send_data(Report.find(params[:report_id]).screenshot, type: 'image/jpeg', disposition: 'inline')
	end

	def update
		result = ScreenshotJob.perform_now Report.find(params[:report_id])
		render json: result
	end
end
