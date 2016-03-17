# Be sure to restart your server when you modify this file.

# Set rufus Scheduler
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

# TODO: remove me
scheduler.every '2m' do
	Rails.logger.info "hello, it's #{Time.now}"
end