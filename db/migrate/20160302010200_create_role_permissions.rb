class CreateRolePermissions < ActiveRecord::Migration
	def change
		create_table :role_permissions do |t|
			t.references :role, :permission, foreign_key: true

			t.timestamps null: false
		end
	end
end
