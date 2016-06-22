class CncertMailer < ApplicationMailer

	default from: 'anti-phishing@cmb.com', to: 'anti-phishing@cncert.com'

	# @param [Report] report
	def report_email(report)
		@report = report
		attachments.inline['screenshot.jpg'] = @report.screenshot
		mail(subject: '[CMB] Phishing Website Report')
	end
end
