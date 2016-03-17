# Be sure to restart your server when you modify this file.

IMGKit.configure do |config|
	# Set WKHTMLTOIMAGE path
	config.wkhtmltoimage = "#{ENV['WKHTMLTOPDF_HOME']}/bin/wkhtmltoimage.exe"
end