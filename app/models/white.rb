# == Schema Information
#
# Table name: whites
#
#  id          :integer          not null, primary key
#  url         :string(255)      not null
#  disposer_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  fk_rails_315b1eb646  (disposer_id)
#  index_whites_on_url  (url) UNIQUE
#
# Foreign Keys
#
#  fk_rails_315b1eb646  (disposer_id => users.id)
#

class White < ActiveRecord::Base
	belongs_to :disposer, class_name: 'User'

	attr_readonly :url, :disposer

	scope :matched, ->(host) { where("? REGEXP concat(url, '$')", host) }

	validates :url, uniqueness: true, format: /(?:(?:[-0-9A-Za-z]|%\h\h)+\.)+(?:[-0-9A-Za-z]|%\h\h)+/
	validates :disposer, presence: true
end
