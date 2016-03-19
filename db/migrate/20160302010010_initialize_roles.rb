class InitializeRoles < ActiveRecord::Migration
	def up
		Role.create(code: 'staff', name: '值班员')
		Role.create(code: 'manager', name: '经理')
		Role.create(code: 'administrator', name: '管理员')
	end

	def down
		Role.destroy_all
	end
end
