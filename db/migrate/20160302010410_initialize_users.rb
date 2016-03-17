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
				role: Role.find_by(code: 'administrator')
			)
			User.create(
				username: 'manager',
				password: Digest::SHA512.hexdigest('manager'),
				name: '经理',
				role: Role.find_by(code: 'manager')
			)
			User.create(
				username: 'staff',
				password: Digest::SHA512.hexdigest('staff'),
				name: '值班员',
				role: Role.find_by(code: 'staff')
			)
		else
			# else
		end
	end

	def down
		User.destroy_all
	end
end