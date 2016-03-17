class CreatePermissions < ActiveRecord::Migration
	def change
		create_table :permissions do |t|
			t.string :code
			t.string :name
			t.string :remark

			t.index :code, unique: true

			t.timestamps null: false
		end
	end
end
