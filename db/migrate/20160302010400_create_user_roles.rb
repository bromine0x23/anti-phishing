class CreateUserRoles < ActiveRecord::Migration
	def change
		create_table :user_roles do |t|
			t.references :user, :role, foreign_key: true

			# t.index :user_id, unique: true

			t.timestamps null: false
		end
	end
end
