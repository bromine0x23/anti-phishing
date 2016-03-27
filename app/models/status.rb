# == Schema Information
#
# Table name: statuses
#
#  id     :integer          not null, primary key
#  code   :string(255)      not null
#  name   :string(255)
#  remark :string(255)
#
# Indexes
#
#  index_statuses_on_code  (code) UNIQUE
#

#
# State Transition:
#
#                                    +------------------+
#                                    |                  |
#   +---------+       +----------+   |   +----------+   |   +--------+
#   | pending +---+---> reported +---+---> accepted +---+---> closed |
#   +---------+   |   +----------+   |   +----------+       +--------+
#                 |                  |
#                 |   +-------+      |   +----------+
#                 +---> fault |      +---> rejected |
#                     +-------+          +----------+

class Status < ActiveRecord::Base

	attr_readonly :code, :name, :remark

	class << self
		def pending;  find_by(code: :pending);  end
		def reported; find_by(code: :reported); end
		def fault;    find_by(code: :fault);    end
		def accepted; find_by(code: :accepted); end
		def rejected; find_by(code: :rejected); end
		def closed;   find_by(code: :closed);   end
	end

	def pending?;   code == :pending;  end
	def reported?;  code == :reported; end
	def fault?;     code == :fault;    end
	def accepted?;  code == :accepted; end
	def rejected?;  code == :rejected; end
	def closed?;    code == :closed;   end

	def code
		@code ||= read_attribute(:code).to_sym
	end
end
