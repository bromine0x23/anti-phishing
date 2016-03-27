class ReceiveCncertMailJob < ActiveJob::Base

	queue_as :default

	def perform
		Mailman::Application.run do
			from 'bromine0x23@163.com', 'ReceiveCncertMailJob#receive'
		end
	end

	# @param [Mail::Message] message
	# @param [Hash] _params
	def receive(message, _params)
		parse(message.text_part.decoded)
	end

	private

	# @param [String] text
	def parse(text)
		status = Status.reported
		text.each_line do |line|
			case line
			when /已受理/
				status = Status.accepted
			when /处理完毕/
				status = Status.closed
			when /未受理/
				status = Status.rejected
			when %r[hxxp://(?<url>(?:(?:[-0-9A-Za-z]|%\h\h)+\.)+(?:[-0-9A-Za-z]|%\h\h)+)]
				update($~[:url], status)
			else
				# ignore
			end
		end
	end

	# @param [String] url
	# @param [Status] status
	def update(url, status)
		unless status.reported?
			(status.closed ? Report.reported_or_accepted : Report.reported)
				.totally_matched(url)
				.update_all(status_id: status, finish_time: Time.current)
		end
	end
end
