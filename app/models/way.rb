# == Schema Information
#
# Table name: ways
#
#  id   :integer          not null, primary key
#  code :string(255)      not null
#  name :string(255)
#
# Indexes
#
#  index_ways_on_code  (code) UNIQUE
#

class Way < ActiveRecord::Base
	attr_readonly :code, :name

	def code
		@code ||= read_attribute(:code).to_sym
	end
end
