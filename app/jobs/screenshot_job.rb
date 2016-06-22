class ScreenshotJob < ActiveJob::Base

	queue_as :default

	# @param [Report] report
	def perform(report)
		kit = IMGKit.new(report.url.to_s, height: 800)
		report.screenshot = kit.to_img(:jpg)
		report.screenshot_type = 'image/jpg'
		report.save
	end
end
