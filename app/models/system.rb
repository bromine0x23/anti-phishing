# == Schema Information
#
# Table name: systems
#
#  id   :integer          not null, primary key
#  code :string(255)      not null
#  name :string(255)
#
# Indexes
#
#  index_systems_on_name  (name) UNIQUE
#

class System < ActiveRecord::Base
	attr_readonly :code, :name

	def code
		@code ||= read_attribute(:code).to_sym
	end
end
