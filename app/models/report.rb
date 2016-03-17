class Report < ActiveRecord::Base
	validates :url, format: /(https?:\\\\)?(\w+\.)+\w+(\\.*)?/i
	belongs_to :status
	belongs_to :origin
	belongs_to :way
	belongs_to :system
	belongs_to :browser
	belongs_to :disposer, class_name: 'User'
end
