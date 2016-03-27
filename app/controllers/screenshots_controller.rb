class ScreenshotsController < ApplicationController

	layout false

	def show
		send_data(Report.find(params[:report_id]).screenshot, type: 'image/jpeg', disposition: 'inline')
	end

	def update
		render json: ScreenshotJob.perform_now(Report.find(params[:report_id]))
	end
end
