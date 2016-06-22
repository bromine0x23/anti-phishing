class FetchFromTencentJob < ActiveJob::Base
	queue_as :default

	def perform
		Rails.logger.info "[#{Time.now}] fetch from Tencent."
	end
end
