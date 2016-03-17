class CreateOrigins < ActiveRecord::Migration
	def change
		create_table :origins do |t|
			t.string :code
			t.string :name

			t.index :code, unique: true
		end
	end
end
