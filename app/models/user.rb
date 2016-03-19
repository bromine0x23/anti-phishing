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
#  on_duty    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username_and_password  (username,password) UNIQUE
#

class User < ActiveRecord::Base
	has_many :user_roles, dependent: :destroy
	has_many :roles, through: :user_roles
	has_many :role_permissions, through: :roles
	has_many :permissions, through: :role_permissions

	def staff?
		roles.any? { |role| role.code == 'staff' }
	end

	def manager?
		roles.any? { |role| role.code == 'manager' }
	end

	def administrator?
		roles.any? { |role| role.code == 'administrator' }
	end
end
