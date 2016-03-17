class CreateWays < ActiveRecord::Migration
	def change
		create_table :ways do |t|
			t.string :code
			t.string :name

			t.index :name, unique: true
		end
	end
end
