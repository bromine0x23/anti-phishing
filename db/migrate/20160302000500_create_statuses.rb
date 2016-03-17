class CreateStatuses < ActiveRecord::Migration
	def change
		create_table :statuses do |t|
			t.string :code
			t.string :name
			t.string :remark

			t.index :code, unique: true
		end
	end
end
