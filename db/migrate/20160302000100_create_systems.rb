class CreateSystems < ActiveRecord::Migration
	def change
		create_table :systems do |t|
			t.string :code
			t.string :name

			t.index :name, unique: true
		end
	end
end
