class CreateUserRoles < ActiveRecord::Migration
	def change
		create_table :user_roles, comment: '用户角色' do |t|
			t.references :user, foreign_key: true, null: false, comment: '用户引用'
			t.references :role, foreign_key: true, null: false, comment: '角色引用'
			t.timestamps null: false
		end
	end
end
