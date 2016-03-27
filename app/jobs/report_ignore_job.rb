class ReportIgnoreJob < ActiveJob::Base

	queue_as :default

	# @param [Report] report
	# @param [User] disposer
	def perform(report, disposer)
		report.status = Status.false
		report.disposer ||= disposer
		report.finish_time = report.dispose_time = Time.current
		report.save
	end
end
