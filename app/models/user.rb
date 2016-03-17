class User < ActiveRecord::Base
	has_one :user_role, dependent: :destroy
	has_one :role, through: :user_role
	has_many :role_permissions, through: :role
	has_many :permissions, through: :role_permissions
end
