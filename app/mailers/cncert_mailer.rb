class CncertMailer < ApplicationMailer

	default from: 'bromine@126.com', to: 'm15596820045@163.com'

	# @param [Report] report
	def report_email(report)
		@report = report
		attachments.inline['screenshot.jpg'] = @report.screenshot
		mail(subject: 'Phishing Website Report')
	end
end
