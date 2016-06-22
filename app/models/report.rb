# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  url             :string(255)      not null
#  loss            :string(255)      default("0")
#  region          :string(255)
#  origin_id       :integer          not null
#  way_id          :integer
#  system_id       :integer
#  browser_id      :integer
#  disposer_id     :integer
#  status_id       :integer          default(1), not null
#  found_time      :datetime         not null
#  report_time     :datetime         not null
#  dispose_time    :datetime
#  finish_time     :datetime
#  screenshot      :binary(16777215)
#  screenshot_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  fk_rails_1d127a16c7  (disposer_id)
#  fk_rails_53f7182c88  (status_id)
#  fk_rails_862054849d  (system_id)
#  fk_rails_b067cbe651  (way_id)
#  fk_rails_c44b45b8f2  (origin_id)
#  fk_rails_c8ae57fdf1  (browser_id)
#
# Foreign Keys
#
#  fk_rails_1d127a16c7  (disposer_id => users.id)
#  fk_rails_53f7182c88  (status_id => statuses.id)
#  fk_rails_862054849d  (system_id => systems.id)
#  fk_rails_b067cbe651  (way_id => ways.id)
#  fk_rails_c44b45b8f2  (origin_id => origins.id)
#  fk_rails_c8ae57fdf1  (browser_id => browsers.id)
#

require 'uri'

class Report < ActiveRecord::Base
	class Screenshot
	end

	belongs_to :status
	belongs_to :origin
	belongs_to :way
	belongs_to :system
	belongs_to :browser
	belongs_to :disposer, class_name: 'User'

	attr_readonly :origin, :way, :system, :browser, :disposer

	accepts_nested_attributes_for :origin
	accepts_nested_attributes_for :way
	accepts_nested_attributes_for :system
	accepts_nested_attributes_for :browser
	accepts_nested_attributes_for :disposer
	accepts_nested_attributes_for :status

	scope :totally_matched, ->(host) { where("url REGEXP concat('https?://', :host, '$')", host: host) }
	scope :suffix_matched, ->(host) { where("url REGEXP concat('^https?://(([-0-9A-Za-z]|%[0-9A-Fa-f]{2})+\\\\.)*', :host, '$')", host: host) }
	scope :fault, ->{ where(status: Status.fault) }
	scope :not_fault, ->{ where.not(status: Status.fault) }
	scope :pending, ->{ where(status: Status.pending) }
	scope :reported, ->{ where(status: Status.reported) }
	scope :reported_or_accepted, ->{ where(status: [ Status.reported, Status.accepted ]) }
	scope :accepted, ->{ where(status: Status.accepted) }

	validates :url, presence: true
	validates :status, presence: true
	validates :origin, presence: true
	validates :disposer, presence: true
	validates :found_time, presence: true
	validates :report_time, presence: true
	with_options if: 'url.present?' do |report|
		report.validates :url, url: true
		report.validate :url_is_not_duplicate, on: :create
		report.validate :url_is_not_white
	end
	with_options if: 'screenshot.present?' do |report|
		report.validates :screenshot_type, presence: true
	end

	# 创建后执行截图任务
	after_commit :screenshot_job, on: :create

	after_initialize do |report|
		report.url = report.read_attribute(:url)
	end

	# @return [URI::Generic]
	def url
		@url
	end

	def url=(url)
		if url
			url.downcase!
			@url = URI(URI.escape(url))
			write_attribute(:url, @url)
		else
			@url = nil
		end
	end

	private

	def screenshot_job
		ScreenshotJob.perform_later self
	end

	# 网址是否已录入
	def url_is_not_duplicate
		if Report.suffix_matched(url.host).not_fault.any?
			errors.add(:url, :duplicate)
		end
	end

	# 网址是否在白名单中
	def url_is_not_white
		if White.matched(url.host).any?
			errors.add(:url, :white)
		end
	end
end
