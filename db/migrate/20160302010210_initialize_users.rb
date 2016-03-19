require 'digest'

class InitializeUsers < ActiveRecord::Migration
	def up
		case Rails.env
		when 'production'
			# production
		when 'development', 'test'
			User.create(
				username: 'administrator',
				password: Digest::SHA512.hexdigest('administrator'),
				name: '管理员',
				roles: Role.where(code: %w(staff manager administrator))
			)
			User.create(
				username: 'manager',
				password: Digest::SHA512.hexdigest('manager'),
				name: '经理',
				roles: Role.where(code: %w(staff manager))
			)
			User.create(
				username: 'staff',
				password: Digest::SHA512.hexdigest('staff'),
				name: '值班员',
				roles: Role.where(code: %w(staff))
			)
		else
			# else
		end
	end

	def down
		User.destroy_all
	end
end