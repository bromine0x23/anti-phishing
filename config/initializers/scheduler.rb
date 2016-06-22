# Be sure to restart your server when you modify this file.

# Set rufus Scheduler
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '2m' do
	FetchFromTencentJob.perform_now
end

scheduler.every '2m' do
	FetchFromBaiduJob.perform_now
end

# scheduler.every '1m' do
# 	ReceiveCncertMailJob.perform_later
# end