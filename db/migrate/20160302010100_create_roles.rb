class CreateRoles < ActiveRecord::Migration
	def change
		create_table :roles do |t|
			t.string :code
			t.string :name
			t.string :remark

			t.index :code, unique: true

			t.timestamps null: false
		end
	end
end
