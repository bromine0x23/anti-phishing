class InitializePermissions < ActiveRecord::Migration
	def up
		Permission.create([
			{ code: 'on_duty', name: '值班' },
			{ code: 'manual_entry', name: '人工录入' },
			{ code: 'export_data', name: '导出数据' },
			{ code: 'website_detail', name: '查看详情' },
			{ code: 'modify_url', name: '修改URL' },
			{ code: 'set_false', name: '网站误报' },
			{ code: 'close_website', name: '上报关闭', remark: '上报CNCERT以关闭网站' },

			{ code: 'manager_whites', name: '管理白名单' },
			{ code: 'view_statistics', name: '查看数据报表' },

			{ code: 'manager_user', name: '管理用户' },
			{ code: 'view_role', name: '查看角色' },
			{ code: 'manager_role', name: '管理角色' },
			{ code: 'view_permission', name: '查看权限' },
			{ code: 'manager_permission', name: '管理权限' },
			{ code: 'assign_role', name: '指派用户角色' },
			{ code: 'assign_permission', name: '指派角色权限' },
		])
	end

	def down
		Permission.destroy_all
	end
end
