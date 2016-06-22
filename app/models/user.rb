# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  password   :string(255)      not null
#  name       :string(255)
#  telephone  :string(255)
#  email      :string(255)
#  role_id    :integer          not null
#  on_duty    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  fk_rails_642f17018b                   (role_id)
#  index_users_on_username_and_password  (username,password) UNIQUE
#
# Foreign Keys
#
#  fk_rails_642f17018b  (role_id => roles.id)
#

class User < ActiveRecord::Base
	belongs_to :role

	accepts_nested_attributes_for :role

	def staff?
		role && role.code == :staff
	end

	def manager?
		role && role.code == :manager
	end

	def administrator?
		role && role.code == :administrator
	end
end
