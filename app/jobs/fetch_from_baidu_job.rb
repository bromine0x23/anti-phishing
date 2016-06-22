class FetchFromBaiduJob < ActiveJob::Base
	queue_as :default

	def perform
		Rails.logger.info "[#{Time.now}] fetch from Baidu."
	end
end
