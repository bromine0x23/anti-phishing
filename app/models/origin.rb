# == Schema Information
#
# Table name: origins
#
#  id   :integer          not null, primary key
#  code :string(255)      not null
#  name :string(255)
#
# Indexes
#
#  index_origins_on_code  (code) UNIQUE
#

class Origin < ActiveRecord::Base

	attr_readonly :code, :name

	class << self
		def staff
			find_by(code: :staff)
		end

		def cmb
			find_by(code: :cmb)
		end
	end

	def code
		@code ||= read_attribute(:code).to_sym
	end
end
