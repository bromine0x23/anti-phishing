class InitializeRoles < ActiveRecord::Migration
	def up
		permissions = Permission.where code: %w(on_duty manual_entry export_data website_detail modify_url set_false close_website)
		Role.create(code: 'staff', name: '值班员', permissions: permissions)

		permissions += Permission.where code: %w(manager_whites view_statistics)
		Role.create(code: 'manager', name: '经理', permissions: permissions)

		permissions += Permission.where code: %w(view_user manager_user view_role manager_role view_permission manager_permission assign_role assign_permission)
		Role.create(code: 'administrator', name: '管理员', permissions: permissions)
	end

	def down
		Role.destroy_all
	end
end
