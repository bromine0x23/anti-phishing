# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  code       :string(255)      not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_code  (code) UNIQUE
#

class Role < ActiveRecord::Base
	attr_readonly :code, :name

	def code
		@code ||= read_attribute(:code).to_sym
	end
end
