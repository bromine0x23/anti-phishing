class ReportConfirmJob < ActiveJob::Base

	queue_as :default

	# @param [Report] report
	# @param [User] disposer
	def perform(report, disposer)
		report.status = Status.reported
		report.disposer ||= disposer
		report.dispose_time = Time.current
		report.save
		CncertMailer.report_email(report).deliver_later
	end
end
