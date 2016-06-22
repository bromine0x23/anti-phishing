class ScreenshotsController < ApplicationController

	layout false

	def create
		@report = Report.find(params[:report_id])
		screenshot = params.require(:report).require(:screenshot)
		@report.screenshot_type = screenshot.content_type
		@report.screenshot = screenshot.read
		@report.save
	end

	def new
		@report = Report.find(params[:report_id])
	end

	def show
		@report = Report.find(params[:report_id])
		if @report.screenshot.present?
			send_data(@report.screenshot, type: @report.screenshot_type, disposition: 'inline')
		else
			redirect_to view_context.image_url('screenshot.png')
		end
	end

	def update
		render json: ScreenshotJob.perform_now(Report.find(params[:report_id]))
	end
end
