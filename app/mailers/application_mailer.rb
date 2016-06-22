class ApplicationMailer < ActionMailer::Base
	default from: 'anti-phishing@cmb.com'
	layout 'mailer'
end
